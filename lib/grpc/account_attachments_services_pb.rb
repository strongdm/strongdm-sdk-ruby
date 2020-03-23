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
# Source: account_attachments.proto for package 'v1'

require "grpc"
require "account_attachments_pb"

module V1
  module AccountAttachments
    # AccountAttachments assign an account to a role.
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.AccountAttachments"

      # Create registers a new AccountAttachment.
      rpc :Create, AccountAttachmentCreateRequest, AccountAttachmentCreateResponse
      # Get reads one AccountAttachment by ID.
      rpc :Get, AccountAttachmentGetRequest, AccountAttachmentGetResponse
      # Delete removes a AccountAttachment by ID.
      rpc :Delete, AccountAttachmentDeleteRequest, AccountAttachmentDeleteResponse
      # List gets a list of AccountAttachments matching a given set of criteria.
      rpc :List, AccountAttachmentListRequest, AccountAttachmentListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
