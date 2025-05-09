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
# source: managed_secrets.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"
require "tags_pb"
require "google/protobuf/timestamp_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("managed_secrets.proto", :syntax => :proto3) do
    add_message "v1.ManagedSecretLogsRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.ManagedSecretLogsResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :managed_secret_logs, :message, 2, "v1.ManagedSecretLog"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.ManagedSecretListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :managed_secrets, :message, 2, "v1.ManagedSecret"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretRetrieveRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
      optional :public_key, :bytes, 3
    end
    add_message "v1.ManagedSecretRetrieveResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :managed_secret, :message, 2, "v1.ManagedSecret"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretValidateRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ManagedSecretValidateResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :valid, :bool, 2
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
      optional :invalid_info, :string, 4
    end
    add_message "v1.ManagedSecretGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ManagedSecretGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :managed_secret, :message, 2, "v1.ManagedSecret"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :managed_secret, :message, 2, "v1.ManagedSecret"
    end
    add_message "v1.ManagedSecretCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :managed_secret, :message, 2, "v1.ManagedSecret"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :managed_secret, :message, 3, "v1.ManagedSecret"
    end
    add_message "v1.ManagedSecretUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :managed_secret, :message, 2, "v1.ManagedSecret"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretRotateRequest" do
      optional :meta, :message, 1, "v1.GenericRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ManagedSecretRotateResponse" do
      optional :meta, :message, 1, "v1.GenericResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretDeleteRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ManagedSecretDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.ManagedSecretLog" do
      optional :id, :string, 1
      optional :created_at, :message, 2, "google.protobuf.Timestamp"
      optional :secret_engine_id, :string, 3
      optional :managed_secret_id, :string, 4
      optional :account_id, :string, 5
      optional :action, :string, 6
      optional :debug, :string, 7
    end
    add_message "v1.ManagedSecret" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :secret_engine_id, :string, 3
      optional :value, :bytes, 4
      optional :secret_store_path, :string, 5
      optional :policy, :message, 6, "v1.ManagedSecretPolicy"
      optional :tags, :message, 7, "v1.Tags"
      optional :last_rotated_at, :message, 8, "google.protobuf.Timestamp"
      optional :expires_at, :message, 9, "google.protobuf.Timestamp"
      optional :config, :string, 10
    end
    add_message "v1.ManagedSecretPolicy" do
      optional :rotation_policy, :message, 1, "v1.ManagedSecretRotationPolicy"
      optional :password_policy, :message, 2, "v1.ManagedSecretPasswordPolicy"
    end
    add_message "v1.ManagedSecretPasswordPolicy" do
      optional :length, :uint32, 1
      optional :exclude_upper_case, :bool, 2
      optional :num_digits, :uint32, 3
      optional :num_symbols, :uint32, 4
      optional :allow_repeat, :bool, 5
      optional :exclude_characters, :string, 6
    end
    add_message "v1.ManagedSecretRotationPolicy" do
    end
  end
end

module V1
  ManagedSecretLogsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretLogsRequest").msgclass
  ManagedSecretLogsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretLogsResponse").msgclass
  ManagedSecretListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretListRequest").msgclass
  ManagedSecretListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretListResponse").msgclass
  ManagedSecretRetrieveRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretRetrieveRequest").msgclass
  ManagedSecretRetrieveResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretRetrieveResponse").msgclass
  ManagedSecretValidateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretValidateRequest").msgclass
  ManagedSecretValidateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretValidateResponse").msgclass
  ManagedSecretGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretGetRequest").msgclass
  ManagedSecretGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretGetResponse").msgclass
  ManagedSecretCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretCreateRequest").msgclass
  ManagedSecretCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretCreateResponse").msgclass
  ManagedSecretUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretUpdateRequest").msgclass
  ManagedSecretUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretUpdateResponse").msgclass
  ManagedSecretRotateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretRotateRequest").msgclass
  ManagedSecretRotateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretRotateResponse").msgclass
  ManagedSecretDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretDeleteRequest").msgclass
  ManagedSecretDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretDeleteResponse").msgclass
  ManagedSecretLog = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretLog").msgclass
  ManagedSecret = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecret").msgclass
  ManagedSecretPolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretPolicy").msgclass
  ManagedSecretPasswordPolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretPasswordPolicy").msgclass
  ManagedSecretRotationPolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ManagedSecretRotationPolicy").msgclass
end
