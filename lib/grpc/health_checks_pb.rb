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
# source: health_checks.proto

require "google/protobuf"

require "google/protobuf/timestamp_pb"
require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("health_checks.proto", :syntax => :proto3) do
    add_message "v1.HealthcheckListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.HealthcheckListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :healthchecks, :message, 2, "v1.Healthcheck"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.Healthcheck" do
      optional :id, :string, 1
      optional :resource_id, :string, 2
      optional :resource_name, :string, 3
      optional :node_id, :string, 4
      optional :node_name, :string, 5
      optional :healthy, :bool, 6
      optional :error_msg, :string, 7
      optional :timestamp, :message, 8, "google.protobuf.Timestamp"
    end
  end
end

module V1
  HealthcheckListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.HealthcheckListRequest").msgclass
  HealthcheckListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.HealthcheckListResponse").msgclass
  Healthcheck = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Healthcheck").msgclass
end
