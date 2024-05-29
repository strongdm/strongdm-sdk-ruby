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
# Source: identity_sets.proto for package 'v1'

require "grpc"
require "identity_sets_pb"

module V1
  module IdentitySets
    # A IdentitySet is a named grouping of Identity Aliases for Accounts.
    # An Account's relationship to a IdentitySet is defined via IdentityAlias objects.
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.IdentitySets"

      # Create registers a new IdentitySet.
      rpc :Create, ::V1::IdentitySetCreateRequest, ::V1::IdentitySetCreateResponse
      # Get reads one IdentitySet by ID.
      rpc :Get, ::V1::IdentitySetGetRequest, ::V1::IdentitySetGetResponse
      # Update replaces all the fields of a IdentitySet by ID.
      rpc :Update, ::V1::IdentitySetUpdateRequest, ::V1::IdentitySetUpdateResponse
      # Delete removes a IdentitySet by ID.
      rpc :Delete, ::V1::IdentitySetDeleteRequest, ::V1::IdentitySetDeleteResponse
      # List gets a list of IdentitySets matching a given set of criteria.
      rpc :List, ::V1::IdentitySetListRequest, ::V1::IdentitySetListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
