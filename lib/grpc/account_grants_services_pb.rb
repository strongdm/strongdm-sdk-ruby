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
# Source: account_grants.proto for package 'v1'

require 'grpc'
require 'account_grants_pb'

module V1
  module AccountGrants
    # AccountGrants assign a resource directly to an account, giving the account the permission to connect to that resource.
    class Service

      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'v1.AccountGrants'

      # Create registers a new AccountGrant.
      rpc :Create, ::V1::AccountGrantCreateRequest, ::V1::AccountGrantCreateResponse
      # Get reads one AccountGrant by ID.
      rpc :Get, ::V1::AccountGrantGetRequest, ::V1::AccountGrantGetResponse
      # Delete removes a AccountGrant by ID.
      rpc :Delete, ::V1::AccountGrantDeleteRequest, ::V1::AccountGrantDeleteResponse
      # List gets a list of AccountGrants matching a given set of criteria.
      rpc :List, ::V1::AccountGrantListRequest, ::V1::AccountGrantListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
