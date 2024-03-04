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
# Source: approval_workflow_approvers.proto for package 'v1'

require "grpc"
require "approval_workflow_approvers_pb"

module V1
  module ApprovalWorkflowApprovers
    # ApprovalWorkflowApprovers link approval workflow approvers to an ApprovalWorkflowStep
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.ApprovalWorkflowApprovers"

      # Create creates a new approval workflow approver.
      rpc :Create, ::V1::ApprovalWorkflowApproverCreateRequest, ::V1::ApprovalWorkflowApproverCreateResponse
      # Get reads one approval workflow approver by ID.
      rpc :Get, ::V1::ApprovalWorkflowApproverGetRequest, ::V1::ApprovalWorkflowApproverGetResponse
      # Delete deletes an existing approval workflow approver.
      rpc :Delete, ::V1::ApprovalWorkflowApproverDeleteRequest, ::V1::ApprovalWorkflowApproverDeleteResponse
      # Lists existing approval workflow approvers.
      rpc :List, ::V1::ApprovalWorkflowApproverListRequest, ::V1::ApprovalWorkflowApproverListResponse
    end

    Stub = Service.rpc_stub_class
  end
end
