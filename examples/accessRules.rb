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

$client = SDM::Client.new(ENV["SDM_API_ACCESS_KEY"], ENV["SDM_API_SECRET_KEY"], host: "localhost:8889", insecure: true)

def create_example_resources
  # create a redis
  redis = SDM::Redis.new()
  redis.name = "example_resource_#{rand(100_000)}"
  redis.hostname = "example.com"
  redis.port_override = rand(3_000...20_000)
  redis.tags = { "env": "staging" }
  $client.resources.create(redis).resource
end

def create_example_role(access_rules)
  $client.roles.create(SDM::Role.new(
    name: "exampleRole-#{rand(10_000)}",
    access_rules: access_rules,
  )).role
end

def create_role_grant_via_access_rules
  resource1 = create_example_resources()
  resource2 = create_example_resources()
  role = create_example_role([{ "ids": [resource1.id] }])

  # add resource2's id to the role's access rules
  role.access_rules[0]["ids"] << resource2.id
  $client.roles.update(role).role
end

def delete_role_grant_via_access_rules
  resource1 = create_example_resources()
  resource2 = create_example_resources()
  role = create_example_role([{ "ids": [resource1.id, resource2.id] }])

  # remove the ID of the second resource
  role.access_rules.first.reject! { |id| id == resource2.id }
  $client.roles.update(role)
end

def list_role_grants_via_access_rules
  resource = create_example_resources
  role = create_example_role([{ "ids": [resource.id] }])

  # role.access_rules contains each AccessRule associate with the role
  puts role.access_rules.first["ids"]
end

def create_and_update_access_rules
  redis = create_example_resources

  # create a role with initial access rule
  access_rules = [
    {
      "ids": [redis.id],
    },
  ]
  role = create_example_role(access_rules)

  # update access rules
  role.access_rules = [
    {
      "tags": { "env": "staging" },
    },
    {
      "type": "redis",
    },
  ]

  $client.roles.update(role).role
end

def main
  # Each of the following functions is an example of how to do an operation using Access Rules

  create_and_update_access_rules

  # The RoleGrants API has been deprecated in favor of Access Rules.
  # When using Access Rules the best practice is to grant Resources access based on Type and Tags.
  # If it is _necessary_ to grant access to specific Resources in the same way as RoleGrants did,
  # you can use Resource IDs directly in Access Rules as shown in the following examples.

  create_role_grant_via_access_rules
  delete_role_grant_via_access_rules
  list_role_grants_via_access_rules
end

main
