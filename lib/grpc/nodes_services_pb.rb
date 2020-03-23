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
# Source: nodes.proto for package 'v1'

require "grpc"
require "nodes_pb"

module V1
  module Nodes
    # Nodes make up the strongDM network, and allow your users to connect securely to your resources.
    # There are two types of nodes:
    # 1. **Relay:** creates connectivity to your datasources, while maintaining the egress-only nature of your firewall
    # 1. **Gateways:** a relay that also listens for connections from strongDM clients
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.Nodes"

      # Create registers a new Node.
      rpc :Create, NodeCreateRequest, NodeCreateResponse
      # Get reads one Node by ID.
      rpc :Get, NodeGetRequest, NodeGetResponse
      # Update patches a Node by ID.
      rpc :Update, NodeUpdateRequest, NodeUpdateResponse
      # Delete removes a Node by ID.
      rpc :Delete, NodeDeleteRequest, NodeDeleteResponse
      # List gets a list of Nodes matching a given set of criteria.
      rpc :List, NodeListRequest, NodeListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
