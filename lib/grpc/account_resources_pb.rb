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
# source: account_resources.proto

require "google/protobuf"

require "google/protobuf/timestamp_pb"
require "options_pb"
require "spec_pb"
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("account_resources.proto", :syntax => :proto3) do
    add_message "v1.AccountResourceListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.AccountResourceListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :account_resources, :message, 2, "v1.AccountResource"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.AccountResource" do
      optional :account_id, :string, 1
      optional :resource_id, :string, 2
      optional :granted_at, :message, 3, "google.protobuf.Timestamp"
      optional :expires_at, :message, 4, "google.protobuf.Timestamp"
      optional :role_id, :string, 5
      optional :account_grant_id, :string, 6
      optional :created_at, :message, 7, "google.protobuf.Timestamp"
    end
  end
end

module V1
  AccountResourceListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountResourceListRequest").msgclass
  AccountResourceListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountResourceListResponse").msgclass
  AccountResource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccountResource").msgclass
end
