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
# source: peering_group_nodes.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("peering_group_nodes.proto", :syntax => :proto3) do
    add_message "v1.PeeringGroupNodeCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :peering_group_node, :message, 2, "v1.PeeringGroupNode"
    end
    add_message "v1.PeeringGroupNodeCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :peering_group_node, :message, 2, "v1.PeeringGroupNode"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.PeeringGroupNodeGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.PeeringGroupNodeGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :peering_group_node, :message, 2, "v1.PeeringGroupNode"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.PeeringGroupNodeDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.PeeringGroupNodeDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.PeeringGroupNodeListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.PeeringGroupNodeListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :peering_group_nodes, :message, 2, "v1.PeeringGroupNode"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.PeeringGroupNode" do
      optional :id, :string, 1
      optional :node_id, :string, 3
      optional :group_id, :string, 4
    end
  end
end

module V1
  PeeringGroupNodeCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeCreateRequest").msgclass
  PeeringGroupNodeCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeCreateResponse").msgclass
  PeeringGroupNodeGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeGetRequest").msgclass
  PeeringGroupNodeGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeGetResponse").msgclass
  PeeringGroupNodeDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeDeleteRequest").msgclass
  PeeringGroupNodeDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeDeleteResponse").msgclass
  PeeringGroupNodeListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeListRequest").msgclass
  PeeringGroupNodeListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNodeListResponse").msgclass
  PeeringGroupNode = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PeeringGroupNode").msgclass
end
