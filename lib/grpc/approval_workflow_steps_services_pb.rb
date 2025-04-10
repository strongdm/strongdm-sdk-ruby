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
# Source: approval_workflow_steps.proto for package 'v1'

require "grpc"
require "approval_workflow_steps_pb"

module V1
  module ApprovalWorkflowSteps
    # ApprovalWorkflowSteps link approval workflow steps to an ApprovalWorkflow
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.ApprovalWorkflowSteps"

      # Deprecated: Create creates a new approval workflow step.
      rpc :Create, ::V1::ApprovalWorkflowStepCreateRequest, ::V1::ApprovalWorkflowStepCreateResponse
      # Deprecated: Get reads one approval workflow step by ID.
      rpc :Get, ::V1::ApprovalWorkflowStepGetRequest, ::V1::ApprovalWorkflowStepGetResponse
      # Deprecated: Delete deletes an existing approval workflow step.
      rpc :Delete, ::V1::ApprovalWorkflowStepDeleteRequest, ::V1::ApprovalWorkflowStepDeleteResponse
      # Deprecated: Lists existing approval workflow steps.
      rpc :List, ::V1::ApprovalWorkflowStepListRequest, ::V1::ApprovalWorkflowStepListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
