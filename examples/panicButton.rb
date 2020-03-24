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
require "strongdm"
require "OpenSSL"
require "JSON"

# panicButton.rb suspends all users except for one admin,
# in the fake use case of a critical break in or something
# usage:
# ruby panicButton.rb adminuser@email.com
# to revert back to pre-panic state:
# ruby panicButton.rb revert
def main
  access_key = ENV["SDM_API_ACCESS_KEY"]
  secret_key = ENV["SDM_API_SECRET_KEY"]
  if access_key == nil or secret_key == nil
    puts "SDM_API_ACCESS_KEY and SDM_API_SECRET_KEY must be provided"
    return
  end
  client = SDM::Client.new(access_key, secret_key)

  if ARGV.size == 1 and ARGV[0] == "revert"
    state_file = File.open("state.json")
    state = JSON.load(state_file)

    reinstated_count = 0

    users = client.accounts.list("")
    users.each { |user|
      if user.suspended
        reinstated_count += 1
        user.suspended = false
        client.accounts.update(user)
      end
    }
    state["attachments"].each { |attachment|
      begin
        a = SDM::AccountAttachment.new()
        a.account_id = attachment["account_id"]
        a.role_id = attachment["role_id"]
        client.account_attachments.create(a)
      rescue SDM::AlreadyExistsError
      rescue => ex
        puts "skipping creation of attachment due to error: " + ex.to_s
      end
    }
    state["grants"].each { |attachment|
      begin
        g = SDM::AccountGrant.new()
        g.account_id = attachment["account_id"]
        g.resource_id = attachment["resource_id"]
        client.account_grants.create(g)
      rescue SDM::AlreadyExistsError
      rescue => ex
        puts "skipping creation of grant due to error: " + ex.to_s
      end
    }

    puts "reinstated " + reinstated_count.to_s + " users"
    puts "recreated " + state["attachments"].size.to_s + " account attachments"
    puts "recreated " + state["grants"].size.to_s + " account grants"

    return
  end

  admin_email = ""
  if ARGV.size == 1
    admin_email = ARGV[0]
  else
    puts "please provide an admin email to preserve"
    return 1
  end

  admin_user_id = ""
  users = client.accounts.list("email:?", admin_email)
  users.each { |user|
    admin_user_id = user.id
  }

  account_attachments = client.account_attachments.list("")
  account_grants = client.account_grants.list("")

  state = {
    'attachments': account_attachments.map { |x|
      if x.account_id != admin_user_id
        out = {
          'account_id': x.account_id,
          'role_id': x.role_id,
        }
      end
    }.reject { |x| x == nil },
    'grants': account_grants.map { |x|
      if x.account_id != admin_user_id and x.valid_until == nil
        out = {
          'account_id': x.account_id,
          'resource_id': x.resource_id,
        }
      end
    }.reject { |x| x == nil },
  }

  puts "storing " + state[:attachments].size.to_s + " account attachments in state"
  puts "storing " + state[:grants].size.to_s + " account grants in state"

  state_file = File.open("state.json", "w")
  state_file.write(state.to_json)

  suspended_count = 0
  users = client.accounts.list("")
  users.each { |user|
    if user.instance_of? SDM::User and user.email == admin_email
      next
    end
    user.suspended = true
    begin
      client.accounts.update(user)
      suspended_count += 1
    rescue StandardError => ex
      puts "skipping user " + user.id + " on account of error: " + ex.to_s
    end
  }

  puts "suspended " + suspended_count.to_s + " users"
end

main()
