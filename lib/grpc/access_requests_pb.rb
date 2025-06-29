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
# source: access_requests.proto

require "google/protobuf"

require "google/protobuf/duration_pb"
require "google/protobuf/timestamp_pb"
require "options_pb"
require "spec_pb"
require "tags_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("access_requests.proto", :syntax => :proto3) do
    add_message "v1.AccessRequestListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.AccessRequestListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :access_requests, :message, 2, "v1.AccessRequest"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.AccessRequest" do
      optional :id, :string, 1
      optional :resource_id, :string, 2
      optional :reason, :string, 3
      optional :workflow_id, :string, 4
      optional :account_id, :string, 5
      optional :start_from, :message, 6, "google.protobuf.Timestamp"
      optional :valid_until, :message, 7, "google.protobuf.Timestamp"
      optional :status, :string, 8
      optional :status_at, :message, 9, "google.protobuf.Timestamp"
      optional :grant_id, :string, 10
      optional :duration, :int64, 11
      optional :requestedDuration, :message, 13, "google.protobuf.Duration"
      optional :resultDuration, :message, 14, "google.protobuf.Duration"
      optional :requester_name, :string, 12
    end
    add_message "v1.AccessRequestEvent" do
      optional :id, :string, 1
      optional :request_id, :string, 2
      optional :actor_id, :string, 3
      optional :type, :string, 4
      optional :metadata, :string, 5
      optional :time, :message, 6, "google.protobuf.Timestamp"
    end
    add_message "v1.RequestableResource" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :healthy, :bool, 3
      optional :type, :string, 4
      optional :authentication, :string, 5
      optional :tags, :message, 6, "v1.Tags"
      optional :access, :string, 7
      optional :privileges, :message, 8, "v1.PrivilegesMessage"
      optional :privileges_requirement_status, :string, 9
    end
    add_message "v1.PrivilegesMessage" do
      optional :kubernetes, :message, 1, "v1.KubernetesPrivileges"
      optional :entraGroups, :message, 2, "v1.EntraGroupPrivileges"
    end
    add_message "v1.KubernetesPrivileges" do
      repeated :groups, :string, 1
    end
    add_message "v1.EntraGroupPrivileges" do
      repeated :groups, :string, 1
    end
    add_message "v1.AccessRequestConfig" do
      optional :resource_id, :string, 1
      optional :reason, :string, 2
      optional :start_from, :message, 3, "google.protobuf.Timestamp"
      optional :duration, :string, 4
    end
    add_message "v1.RequestAccessRequestConfig" do
      repeated :resource_ids, :string, 1
      optional :reason, :string, 2
      optional :start_from, :message, 3, "google.protobuf.Timestamp"
      optional :duration, :string, 4
      optional :access_rules, :string, 5
    end
  end
end

module V1
  AccessRequestListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccessRequestListRequest").msgclass
  AccessRequestListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccessRequestListResponse").msgclass
  AccessRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccessRequest").msgclass
  AccessRequestEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccessRequestEvent").msgclass
  RequestableResource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RequestableResource").msgclass
  PrivilegesMessage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PrivilegesMessage").msgclass
  KubernetesPrivileges = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.KubernetesPrivileges").msgclass
  EntraGroupPrivileges = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.EntraGroupPrivileges").msgclass
  AccessRequestConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AccessRequestConfig").msgclass
  RequestAccessRequestConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RequestAccessRequestConfig").msgclass
end
