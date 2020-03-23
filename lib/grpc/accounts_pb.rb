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
# source: accounts.proto

require "google/protobuf"

require "google/api/annotations_pb"
require "protoc-gen-swagger/options/annotations_pb"
require "options_pb"
require "spec_pb"
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("accounts.proto", :syntax => :proto3) do
    add_message "v1.AccountCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :account, :message, 2, "v1.Account"
    end
    add_message "v1.AccountCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :account, :message, 2, "v1.Account"
      optional :token, :string, 3
      optional :rate_limit, :message, 4, "v1.RateLimitMetadata"
    end
    add_message "v1.AccountGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.AccountGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :account, :message, 2, "v1.Account"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.AccountUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :account, :message, 3, "v1.Account"
    end
    add_message "v1.AccountUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :account, :message, 2, "v1.Account"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.AccountDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.AccountDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.AccountListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.AccountListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :accounts, :message, 2, "v1.Account"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.Account" do
      oneof :account do
        optional :user, :message, 1, "v1.User"
        optional :service, :message, 2, "v1.Service"
      end
    end
    add_message "v1.User" do
      optional :id, :string, 1
      optional :email, :string, 2
      optional :first_name, :string, 3
      optional :last_name, :string, 4
      optional :suspended, :bool, 5
    end
    add_message "v1.Service" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :suspended, :bool, 3
    end
  end
end

module V1
  AccountCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountCreateRequest").msgclass
  AccountCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountCreateResponse").msgclass
  AccountGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountGetRequest").msgclass
  AccountGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountGetResponse").msgclass
  AccountUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountUpdateRequest").msgclass
  AccountUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountUpdateResponse").msgclass
  AccountDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountDeleteRequest").msgclass
  AccountDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountDeleteResponse").msgclass
  AccountListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountListRequest").msgclass
  AccountListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountListResponse").msgclass
  Account = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Account").msgclass
  User = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.User").msgclass
  Service = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Service").msgclass
end
