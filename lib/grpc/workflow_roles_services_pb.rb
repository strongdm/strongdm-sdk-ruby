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
# Source: workflow_roles.proto for package 'v1'

require "grpc"
require "workflow_roles_pb"

module V1
  module WorkflowRoles
    # WorkflowRole links a role to a workflow. The linked roles indicate which roles a user must be a part of
    # to request access to a resource via the workflow.
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.WorkflowRoles"

      # Create creates a new workflow role
      rpc :Create, V1::WorkflowRolesCreateRequest, V1::WorkflowRolesCreateResponse
      # Get reads one workflow role by ID.
      rpc :Get, V1::WorkflowRoleGetRequest, V1::WorkflowRoleGetResponse
      # Delete deletes a workflow role
      rpc :Delete, V1::WorkflowRolesDeleteRequest, V1::WorkflowRolesDeleteResponse
      # Lists existing workflow roles.
      rpc :List, V1::WorkflowRolesListRequest, V1::WorkflowRolesListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
