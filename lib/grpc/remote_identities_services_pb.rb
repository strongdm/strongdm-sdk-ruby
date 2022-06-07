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
# Source: remote_identities.proto for package 'v1'

require "grpc"
require "remote_identities_pb"

module V1
  module RemoteIdentities
    # RemoteIdentities assign a resource directly to an account, giving the account the permission to connect to that resource.
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.RemoteIdentities"

      # Create registers a new RemoteIdentity.
      rpc :Create, V1::RemoteIdentityCreateRequest, V1::RemoteIdentityCreateResponse
      # Get reads one RemoteIdentity by ID.
      rpc :Get, V1::RemoteIdentityGetRequest, V1::RemoteIdentityGetResponse
      # Delete removes a RemoteIdentity by ID.
      rpc :Delete, V1::RemoteIdentityDeleteRequest, V1::RemoteIdentityDeleteResponse
      # List gets a list of RemoteIdentities matching a given set of criteria.
      rpc :List, V1::RemoteIdentityListRequest, V1::RemoteIdentityListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
