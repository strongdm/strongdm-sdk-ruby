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
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: identity_aliases.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("identity_aliases.proto", :syntax => :proto3) do
    add_message "v1.IdentityAliasCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :identity_alias, :message, 2, "v1.IdentityAlias"
    end
    add_message "v1.IdentityAliasCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :identity_alias, :message, 2, "v1.IdentityAlias"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentityAliasGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.IdentityAliasGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :identity_alias, :message, 2, "v1.IdentityAlias"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentityAliasUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :identity_alias, :message, 3, "v1.IdentityAlias"
    end
    add_message "v1.IdentityAliasUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :identity_alias, :message, 2, "v1.IdentityAlias"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentityAliasDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.IdentityAliasDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentityAliasListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.IdentityAliasListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :identity_aliases, :message, 2, "v1.IdentityAlias"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentityAlias" do
      optional :id, :string, 1
      optional :account_id, :string, 2
      optional :identity_set_id, :string, 3
      optional :username, :string, 4
    end
  end
end

module V1
  IdentityAliasCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasCreateRequest").msgclass
  IdentityAliasCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasCreateResponse").msgclass
  IdentityAliasGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasGetRequest").msgclass
  IdentityAliasGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasGetResponse").msgclass
  IdentityAliasUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasUpdateRequest").msgclass
  IdentityAliasUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasUpdateResponse").msgclass
  IdentityAliasDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasDeleteRequest").msgclass
  IdentityAliasDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasDeleteResponse").msgclass
  IdentityAliasListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasListRequest").msgclass
  IdentityAliasListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAliasListResponse").msgclass
  IdentityAlias = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentityAlias").msgclass
end
