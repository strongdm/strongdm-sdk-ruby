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
# Source: remote_identities_history.proto for package 'v1'

require "grpc"
require "remote_identities_history_pb"

module V1
  module RemoteIdentitiesHistory
    # RemoteIdentitiesHistory records all changes to the state of a RemoteIdentity.
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.RemoteIdentitiesHistory"

      # List gets a list of RemoteIdentityHistory records matching a given set of criteria.
      rpc :List, ::V1::RemoteIdentityHistoryListRequest, ::V1::RemoteIdentityHistoryListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
