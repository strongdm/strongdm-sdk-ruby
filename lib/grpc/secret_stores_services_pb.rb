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
# Source: secret_stores.proto for package 'v1'

require "grpc"
require "secret_stores_pb"

module V1
  module SecretStores
    # SecretStores are servers where resource secrets (passwords, keys) are stored.
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.SecretStores"

      rpc :Create, ::V1::SecretStoreCreateRequest, ::V1::SecretStoreCreateResponse
      # Get reads one SecretStore by ID.
      rpc :Get, ::V1::SecretStoreGetRequest, ::V1::SecretStoreGetResponse
      # Update replaces all the fields of a SecretStore by ID.
      rpc :Update, ::V1::SecretStoreUpdateRequest, ::V1::SecretStoreUpdateResponse
      # Delete removes a SecretStore by ID.
      rpc :Delete, ::V1::SecretStoreDeleteRequest, ::V1::SecretStoreDeleteResponse
      # List gets a list of SecretStores matching a given set of criteria.
      rpc :List, ::V1::SecretStoreListRequest, ::V1::SecretStoreListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
