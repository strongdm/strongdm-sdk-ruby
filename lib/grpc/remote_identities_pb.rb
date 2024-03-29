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
# source: remote_identities.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("remote_identities.proto", :syntax => :proto3) do
    add_message "v1.RemoteIdentityCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :remote_identity, :message, 2, "v1.RemoteIdentity"
    end
    add_message "v1.RemoteIdentityCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :remote_identity, :message, 2, "v1.RemoteIdentity"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RemoteIdentityGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.RemoteIdentityGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :remote_identity, :message, 2, "v1.RemoteIdentity"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RemoteIdentityUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :remote_identity, :message, 3, "v1.RemoteIdentity"
    end
    add_message "v1.RemoteIdentityUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :remote_identity, :message, 2, "v1.RemoteIdentity"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RemoteIdentityDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.RemoteIdentityDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.RemoteIdentityListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.RemoteIdentityListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :remote_identities, :message, 2, "v1.RemoteIdentity"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RemoteIdentity" do
      optional :id, :string, 1
      optional :account_id, :string, 2
      optional :remote_identity_group_id, :string, 3
      optional :username, :string, 4
    end
  end
end

module V1
  RemoteIdentityCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityCreateRequest").msgclass
  RemoteIdentityCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityCreateResponse").msgclass
  RemoteIdentityGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityGetRequest").msgclass
  RemoteIdentityGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityGetResponse").msgclass
  RemoteIdentityUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityUpdateRequest").msgclass
  RemoteIdentityUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityUpdateResponse").msgclass
  RemoteIdentityDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityDeleteRequest").msgclass
  RemoteIdentityDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityDeleteResponse").msgclass
  RemoteIdentityListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityListRequest").msgclass
  RemoteIdentityListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentityListResponse").msgclass
  RemoteIdentity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RemoteIdentity").msgclass
end
