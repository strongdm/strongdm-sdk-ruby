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
# source: identity_sets.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("identity_sets.proto", :syntax => :proto3) do
    add_message "v1.IdentitySetCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :identity_set, :message, 2, "v1.IdentitySet"
    end
    add_message "v1.IdentitySetCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :identity_set, :message, 2, "v1.IdentitySet"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentitySetGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.IdentitySetGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :identity_set, :message, 2, "v1.IdentitySet"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentitySetUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :identity_set, :message, 3, "v1.IdentitySet"
    end
    add_message "v1.IdentitySetUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :identity_set, :message, 2, "v1.IdentitySet"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentitySetDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.IdentitySetDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentitySetListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.IdentitySetListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :identity_sets, :message, 2, "v1.IdentitySet"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.IdentitySet" do
      optional :id, :string, 1
      optional :name, :string, 2
    end
  end
end

module V1
  IdentitySetCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetCreateRequest").msgclass
  IdentitySetCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetCreateResponse").msgclass
  IdentitySetGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetGetRequest").msgclass
  IdentitySetGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetGetResponse").msgclass
  IdentitySetUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetUpdateRequest").msgclass
  IdentitySetUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetUpdateResponse").msgclass
  IdentitySetDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetDeleteRequest").msgclass
  IdentitySetDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetDeleteResponse").msgclass
  IdentitySetListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetListRequest").msgclass
  IdentitySetListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySetListResponse").msgclass
  IdentitySet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.IdentitySet").msgclass
end