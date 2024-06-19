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
# source: organization_history.proto

require "google/protobuf"

require "google/protobuf/timestamp_pb"
require "google/protobuf/duration_pb"
require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("organization_history.proto", :syntax => :proto3) do
    add_message "v1.OrganizationHistoryListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.OrganizationHistoryListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :history, :message, 2, "v1.OrganizationHistoryRecord"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.OrganizationHistoryRecord" do
      optional :activity_id, :string, 1
      optional :timestamp, :message, 2, "google.protobuf.Timestamp"
      optional :organization, :message, 3, "v1.Organization"
    end
    add_message "v1.Organization" do
      optional :name, :string, 1
      optional :created_at, :message, 2, "google.protobuf.Timestamp"
      optional :updated_at, :message, 3, "google.protobuf.Timestamp"
      optional :auth_provider, :string, 4
      optional :idle_timeout_enabled, :bool, 5
      optional :idle_timeout, :message, 6, "google.protobuf.Duration"
      optional :session_timeout_enabled, :bool, 7
      optional :session_timeout, :message, 8, "google.protobuf.Duration"
      optional :mfa_enabled, :bool, 9
      optional :mfa_provider, :string, 10
      optional :log_remote_encoder, :string, 11
      optional :log_local_storage, :string, 12
      optional :log_local_encoder, :string, 13
      optional :log_local_format, :string, 14
      optional :log_tcp_address, :string, 15
      optional :log_socket_path, :string, 16
      optional :scim_provider, :string, 17
      optional :websites_subdomain, :string, 18
      optional :ssh_certificate_authority_public_key, :string, 19
      optional :ssh_certificate_authority_updated_at, :message, 20, "google.protobuf.Timestamp"
      optional :require_secret_store, :bool, 21
      optional :sensitive_label, :string, 22
      optional :saml_metadata_url, :string, 23
      optional :kind, :string, 24
      optional :id, :string, 25
      optional :loopback_subnet, :string, 26
      optional :device_trust_enabled, :bool, 27
      optional :device_trust_provider, :string, 28
    end
  end
end

module V1
  OrganizationHistoryListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.OrganizationHistoryListRequest").msgclass
  OrganizationHistoryListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.OrganizationHistoryListResponse").msgclass
  OrganizationHistoryRecord = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.OrganizationHistoryRecord").msgclass
  Organization = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Organization").msgclass
end
