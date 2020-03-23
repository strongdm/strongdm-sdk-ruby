require 'yaml'
require 'strongdm'
require 'oktakit'
require 'optparse'

SDM_API_ACCESS_KEY = ENV.fetch('SDM_API_ACCESS_KEY', '')
SDM_API_SECRET_KEY = ENV.fetch('SDM_API_SECRET_KEY','')
OKTA_CLIENT_TOKEN = ENV.fetch('OKTA_CLIENT_TOKEN', '')
OKTA_CLIENT_ORGURL = ENV.fetch('OKTA_CLIENT_ORGURL','')

def okta_sync
	if SDM_API_ACCESS_KEY == "" || SDM_API_SECRET_KEY == "" || OKTA_CLIENT_TOKEN == "" || OKTA_CLIENT_ORGURL == ""
		puts "SDM_API_ACCESS_KEY, SDM_API_SECRET_KEY, OKTA_CLIENT_TOKEN, and OKTA_CLIENT_ORGURL must be set"
		exit
	end

	plan = false
	OptionParser.new do |opts|
		opts.banner = 'Usage oktaSync.rb [options]'
		opts.on('-p', '--plan', 'calculate changes but do not apply them') do |p|
			plan = p
		end
	end.parse!

	client = SDM::Client.new(SDM_API_ACCESS_KEY, SDM_API_SECRET_KEY, host:"localhost:8889", insecure:true)
	okta_client = Oktakit.new(token: OKTA_CLIENT_TOKEN, api_endpoint: OKTA_CLIENT_ORGURL+"/api/v1")
	matchers = YAML.load(File.read("matchers.yml"))

	all_users = okta_client.list_users({
		'query':{
			'search': "profile.department eq \"Engineering\" and (status eq \"ACTIVE\")"
		}
	})

	okta_users = Array.new()
	all_users[0].each{ |u|
		groups = okta_client.get_member_groups(u.id)
		group_names = Array.new()
		groups[0].each{ |ug|
			group_names.push(ug.profile.name)
		}
		okta_users.push({:login => u.profile.login, :first_name => u.profile.firstName, :last_name => u.profile.LastName, :groups => group_names})
	}

	accounts = client.accounts.list('type:user').map{ |a| [a.email, a.id] }.to_h
	grants = client.account_grants.list('').map{ |ag| ag }

	current = {}
	grants.each{ |g|
		current[g.account_id] = [] if not current[g.account_id]
		current[g.account_id].push({ :resource_id => g.resource_id, :id => g.id })
	}

	desired = {}
	overlapping = 0
	matchers["groups"].each{ |group|
		group["resources"].each { |resourceQuery|
			client.resources.list(resourceQuery).each { |res|
				okta_users.each { |u|
					if u[:groups].include? group["name"]
						aid = accounts[u[:login]]
						if aid != nil
							overlapping += 1
							desired[aid] = [] if not desired[aid]
							desired[aid].push(res.id)
						end
					end
				}
			}
		}
	}

	revocations = 0
	current.each { |aid, curRes|
		desRes = desired[aid]
		desRes = [] if not desired[aid]
		curRes.each { |r|
			if not (desRes.include? r[:resource_id])
				if plan
					puts "Plan: revoke %s from user %s\n" % [r[:resource_id], aid]
				else
					client.account_grants.delete(r[:id])
				end
				revocations += 1
			end
		}
	}

	grants = 0
	desired.each { |aid, desRes|
		curRes = current[aid]
		curRes = [] if not current[aid]
		desRes.each { |r|
			if not (curRes.map{|c| c[:resource_id]}.include? r)
				ag = SDM::AccountGrant.new()
				ag.account_id = aid
				ag.resource_id = r
				if plan
					puts "Plan: grant %s to user %s\n" % [r, aid]
				else
					client.account_grants.create(ag)
				end
				grants +=1
			end
		}
	}

	puts "%d Okta users, %d strongDM users, %d overlapping users, %d grants, %d revocations" % [okta_users.size, accounts.size, overlapping, grants, revocations]
end

begin
	okta_sync
rescue StandardError => ex
	puts "cannot synchronize with okta: " + ex.to_s
end