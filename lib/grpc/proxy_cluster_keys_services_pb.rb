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
# Source: proxy_cluster_keys.proto for package 'v1'

require "grpc"
require "proxy_cluster_keys_pb"

module V1
  module ProxyClusterKeys
    # Proxy Cluster Keys are authentication keys for all proxies within a cluster.
    # The proxies within a cluster share the same key. One cluster can have
    # multiple keys in order to facilitate key rotation.
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.ProxyClusterKeys"

      # Create registers a new ProxyClusterKey.
      rpc :Create, ::V1::ProxyClusterKeyCreateRequest, ::V1::ProxyClusterKeyCreateResponse
      # Get reads one ProxyClusterKey by ID.
      rpc :Get, ::V1::ProxyClusterKeyGetRequest, ::V1::ProxyClusterKeyGetResponse
      # Delete removes a ProxyClusterKey by ID.
      rpc :Delete, ::V1::ProxyClusterKeyDeleteRequest, ::V1::ProxyClusterKeyDeleteResponse
      # List gets a list of ProxyClusterKeys matching a given set of criteria.
      rpc :List, ::V1::ProxyClusterKeyListRequest, ::V1::ProxyClusterKeyListResponse
    end

    Stub = Service.rpc_stub_class
  end
end