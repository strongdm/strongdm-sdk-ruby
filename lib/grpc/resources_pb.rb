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
# source: resources.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"
require "drivers_pb"
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("resources.proto", :syntax => :proto3) do
    add_message "v1.ResourceCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :resource, :message, 2, "v1.Resource"
    end
    add_message "v1.ResourceCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :resource, :message, 2, "v1.Resource"
      optional :rate_limit, :message, 4, "v1.RateLimitMetadata"
    end
    add_message "v1.ResourceGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ResourceGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :resource, :message, 2, "v1.Resource"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ResourceUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :resource, :message, 3, "v1.Resource"
    end
    add_message "v1.ResourceUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :resource, :message, 2, "v1.Resource"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ResourceDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ResourceDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.ResourceListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.ResourceListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :resources, :message, 2, "v1.Resource"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
  end
end

module V1
  ResourceCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceCreateRequest").msgclass
  ResourceCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceCreateResponse").msgclass
  ResourceGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceGetRequest").msgclass
  ResourceGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceGetResponse").msgclass
  ResourceUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceUpdateRequest").msgclass
  ResourceUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceUpdateResponse").msgclass
  ResourceDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceDeleteRequest").msgclass
  ResourceDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceDeleteResponse").msgclass
  ResourceListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceListRequest").msgclass
  ResourceListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ResourceListResponse").msgclass
end
