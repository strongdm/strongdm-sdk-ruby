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
# Source: workflow_approvers.proto for package 'v1'

require "grpc"
require "workflow_approvers_pb"

module V1
  module WorkflowApprovers
    # WorkflowApprovers is an account with the ability to approve requests bound to a workflow.
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.WorkflowApprovers"

      # Create creates a new workflow approver
      rpc :Create, ::V1::WorkflowApproversCreateRequest, ::V1::WorkflowApproversCreateResponse
      # Get reads one workflow approver by ID.
      rpc :Get, ::V1::WorkflowApproverGetRequest, ::V1::WorkflowApproverGetResponse
      # Delete deletes a workflow approver
      rpc :Delete, ::V1::WorkflowApproversDeleteRequest, ::V1::WorkflowApproversDeleteResponse
      # Lists existing workflow approvers.
      rpc :List, ::V1::WorkflowApproversListRequest, ::V1::WorkflowApproversListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
