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
# Source: secret_engines.proto for package 'v1'

require "grpc"
require "secret_engines_pb"

module V1
  module SecretEngines
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.SecretEngines"

      # List returns a list of Secret Engines
      rpc :List, ::V1::SecretEngineListRequest, ::V1::SecretEngineListResponse
      # Get returns a secret engine details
      rpc :Get, ::V1::SecretEngineGetRequest, ::V1::SecretEngineGetResponse
      # Create creates a secret engine
      rpc :Create, ::V1::SecretEngineCreateRequest, ::V1::SecretEngineCreateResponse
      # Update updates a secret engine
      rpc :Update, ::V1::SecretEngineUpdateRequest, ::V1::SecretEngineUpdateResponse
      # Delete deletes a secret engine
      rpc :Delete, ::V1::SecretEngineDeleteRequest, ::V1::SecretEngineDeleteResponse
      # ListSecretStores returns a list of Secret Stores that can be used as a backing store
      # for Secret Engine
      rpc :ListSecretStores, ::V1::SecretStoreListRequest, ::V1::SecretStoreListResponse
      # GenerateKeys generates a private key, stores it in a secret store and stores a public key in a secret engine
      rpc :GenerateKeys, ::V1::GenerateKeysRequest, ::V1::GenerateKeysResponse
      # Healthcheck triggers a healthcheck for all nodes serving a secret engine
      rpc :Healthcheck, ::V1::HealthcheckRequest, ::V1::HealthcheckResponse
      # Rotate rotates secret engine's credentials
      rpc :Rotate, ::V1::SecretEngineRotateRequest, ::V1::SecretEngineRotateResponse
    end

    Stub = Service.rpc_stub_class
  end
end
