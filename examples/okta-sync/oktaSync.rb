# Copyright 2020 StrongDM Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright 2020 StrongDM Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "yaml"
require "strongdm"
require "oktakit"
require "optparse"

SDM_API_ACCESS_KEY = ENV.fetch("SDM_API_ACCESS_KEY", "")
SDM_API_SECRET_KEY = ENV.fetch("SDM_API_SECRET_KEY", "")
OKTA_CLIENT_TOKEN = ENV.fetch("OKTA_CLIENT_TOKEN", "")
OKTA_CLIENT_ORGURL = ENV.fetch("OKTA_CLIENT_ORGURL", "")

def okta_sync
  if SDM_API_ACCESS_KEY == "" || SDM_API_SECRET_KEY == "" || OKTA_CLIENT_TOKEN == "" || OKTA_CLIENT_ORGURL == ""
    puts "SDM_API_ACCESS_KEY, SDM_API_SECRET_KEY, OKTA_CLIENT_TOKEN, and OKTA_CLIENT_ORGURL must be set"
    exit
  end

  report = {
    :start => Time.now,

    :oktaUsersCount => 0,
    :oktaUsers => [],

    :sdmUsersCount => 0,
    :sdmUsers => [],

    :bothUsersCount => 0,

    :sdmResourcesCount => 0,
    :sdmResources => {},

    :permissionsGranted => 0,
    :permissionsRevoked => 0,
    :grants => [],
    :revocations => [],

    :matchers => {},
  }

  plan = false
  verbose = false
  OptionParser.new do |opts|
    opts.banner = "Usage oktaSync.rb [options]"
    opts.on("-p", "--plan", "calculate changes but do not apply them") do |p|
      plan = p
    end
    opts.on("-v", "--verbose", "print detailed report") do |v|
      verbose = v
    end
  end.parse!

  client = SDM::Client.new(SDM_API_ACCESS_KEY, SDM_API_SECRET_KEY)
  okta_client = Oktakit.new(token: OKTA_CLIENT_TOKEN, api_endpoint: OKTA_CLIENT_ORGURL + "/api/v1")
  matchers = YAML.load(File.read("matchers.yml"))
  report[:matchers] = matchers

  all_users = okta_client.list_users({
    'query': {
      'search': "profile.department eq \"Engineering\" and (status eq \"ACTIVE\")",
    },
  })

  okta_users = Array.new()
  all_users[0].each { |u|
    groups = okta_client.get_member_groups(u.id)
    group_names = Array.new()
    groups[0].each { |ug|
      group_names.push(ug.profile.name)
    }
    okta_users.push({ :login => u.profile.login, :first_name => u.profile.firstName, :last_name => u.profile.LastName, :groups => group_names })
  }
  report[:oktaUsers] = okta_users
  report[:oktaUsersCount] = okta_users.size

  accounts = client.accounts.list("type:user").map { |a| [a.email, a] }.to_h
  report[:sdmUsers] = accounts
  report[:sdmUsersCount] = accounts.size
  grants = client.account_grants.list("").map { |ag| ag }

  current = {}
  grants.each { |g|
    current[g.account_id] = [] if not current[g.account_id]
    current[g.account_id].push({ :resource_id => g.resource_id, :id => g.id })
  }

  desired = {}
  overlapping = 0
  matchers["groups"].each { |group|
    group["resources"].each { |resourceQuery|
      client.resources.list(resourceQuery).each { |res|
        report[:sdmResources][res.id] = res
        okta_users.each { |u|
          if u[:groups].include? group["name"]
            account = accounts[u[:login]]
            if account != nil
              overlapping += 1
              desired[account.id] = [] if not desired[account.id]
              desired[account.id].push(res.id)
            end
          end
        }
      }
    }
  }
  report[:bothUsersCount] = overlapping
  report[:sdmResourcesCount] = report[:sdmResources].size

  revocations = 0
  current.each { |aid, curRes|
    desRes = desired[aid]
    desRes = [] if not desired[aid]
    curRes.each { |r|
      if not(desRes.include? r[:resource_id])
        if plan
          puts "Plan: revoke %s from user %s\n" % [r[:resource_id], aid]
        else
          client.account_grants.delete(r[:id])
        end
        report[:revocations].push(r[:id])
        revocations += 1
      end
    }
  }
  report[:permissionsRevoked] = revocations

  grants = 0
  desired.each { |aid, desRes|
    curRes = current[aid]
    curRes = [] if not current[aid]
    desRes.each { |r|
      if not(curRes.map { |c| c[:resource_id] }.include? r)
        ag = SDM::AccountGrant.new()
        ag.account_id = aid
        ag.resource_id = r
        if plan
          puts "Plan: grant %s to user %s\n" % [r, aid]
        else
          client.account_grants.create(ag)
        end
        report[:grants].push(ag)
        grants += 1
      end
    }
  }
  report[:permissionsGranted] = grants

  report[:complete] = Time.now

  if verbose
    puts report.to_json
  else
    puts "%d Okta users, %d strongDM users, %d overlapping users, %d grants, %d revocations" % [okta_users.size, accounts.size, overlapping, grants, revocations]
  end
end

begin
  okta_sync
rescue StandardError => ex
  puts "cannot synchronize with okta: " + ex.to_s
end
