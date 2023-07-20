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
# Source: peering_group_peers.proto for package 'v1'

require "grpc"
require "peering_group_peers_pb"

module V1
  module PeeringGroupPeers
    # PeeringGroupPeers provides the building blocks necessary to link two peering groups.
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.PeeringGroupPeers"

      # Create links two peering groups.
      rpc :Create, V1::PeeringGroupPeerCreateRequest, V1::PeeringGroupPeerCreateResponse
      # Delete unlinks two peering groups.
      rpc :Delete, V1::PeeringGroupPeerDeleteRequest, V1::PeeringGroupPeerDeleteResponse
      # Get reads the information of one peering group link.
      rpc :Get, V1::PeeringGroupPeerGetRequest, V1::PeeringGroupPeerGetResponse
      # List gets a list of peering group links.
      rpc :List, V1::PeeringGroupPeerListRequest, V1::PeeringGroupPeerListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
