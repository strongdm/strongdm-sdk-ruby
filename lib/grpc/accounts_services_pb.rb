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
# Source: accounts.proto for package 'v1'

require "grpc"
require "accounts_pb"

module V1
  module Accounts
    # Accounts are users that have access to strongDM.
    # There are two types of accounts:
    # 1. **Regular users:** humans who are authenticated through username and password or SSO
    # 2. **Service users:** machines that are authneticated using a service token
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.Accounts"

      # Create registers a new Account.
      rpc :Create, AccountCreateRequest, AccountCreateResponse
      # Get reads one Account by ID.
      rpc :Get, AccountGetRequest, AccountGetResponse
      # Update patches a Account by ID.
      rpc :Update, AccountUpdateRequest, AccountUpdateResponse
      # Delete removes a Account by ID.
      rpc :Delete, AccountDeleteRequest, AccountDeleteResponse
      # List gets a list of Accounts matching a given set of criteria.
      rpc :List, AccountListRequest, AccountListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
