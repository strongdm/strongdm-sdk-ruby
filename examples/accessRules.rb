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

$client = SDM::Client.new(ENV["SDM_API_ACCESS_KEY"], ENV["SDM_API_SECRET_KEY"])

def create_example_resource
  # create a redis
  redis = SDM::Redis.new()
  redis.name = "example_resource_#{rand(100_000)}"
  redis.hostname = "example.com"
  redis.port_override = rand(3_000...20_000)
  redis.tags = { "env": "staging" }
  $client.resources.create(redis).resource.id
end

def create_example_role(access_rules)
  $client.roles.create(SDM::Role.new(
    name: "exampleRole-#{rand(10_000)}",
    access_rules: access_rules,
  )).role.id
end

def create_role_grant_via_access_rules
  resource1_id = create_example_resource()
  resource2_id = create_example_resource()
  role_id = create_example_role([{ "ids": [resource1_id] }])

  # add resource2's id to the role's access rules
  role = $client.roles.get(role_id).role
  role.access_rules[0]["ids"] << resource2_id
  $client.roles.update(role).role
end

def delete_role_grant_via_access_rules
  resource1_id = create_example_resource()
  resource2_id = create_example_resource()
  role_id = create_example_role([{ "ids": [resource1_id, resource2_id] }])

  # remove the ID of the second resource
  role = $client.roles.get(role_id).role
  role.access_rules.first.reject! { |id| id == resource2_id }
  $client.roles.update(role)
end

def list_role_grants_via_access_rules
  resource_id = create_example_resource()
  role_id = create_example_role([{ "ids": [resource_id] }])

  # role.access_rules contains each AccessRule associate with the role
  role = $client.roles.get(role_id).role
  puts role.access_rules.first["ids"]
end

def create_and_update_access_rules
  redis_id = create_example_resource()

  # create a role with initial access rule
  access_rules = [
    {
      "ids": [redis_id],
    },
  ]
  role_id = $client.roles.create(SDM::Role.new(
    name: "exampleRole-#{rand(10_000)}",
    access_rules: access_rules,
  )).role.id

  # update access rules
  role = $client.roles.get(role_id).role
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
