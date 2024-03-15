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
# source: approval_workflow_approvers.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("approval_workflow_approvers.proto", :syntax => :proto3) do
    add_message "v1.ApprovalWorkflowApproverCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :approval_workflow_approver, :message, 2, "v1.ApprovalWorkflowApprover"
    end
    add_message "v1.ApprovalWorkflowApproverCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :approval_workflow_approver, :message, 2, "v1.ApprovalWorkflowApprover"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ApprovalWorkflowApproverGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ApprovalWorkflowApproverGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :approval_workflow_approver, :message, 2, "v1.ApprovalWorkflowApprover"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ApprovalWorkflowApproverDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ApprovalWorkflowApproverDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :id, :string, 2
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ApprovalWorkflowApproverListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.ApprovalWorkflowApproverListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :approval_workflow_approvers, :message, 2, "v1.ApprovalWorkflowApprover"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ApprovalWorkflowApprover" do
      optional :id, :string, 1
      optional :approval_flow_id, :string, 2
      optional :approval_step_id, :string, 3
      optional :account_id, :string, 4
      optional :role_id, :string, 5
    end
  end
end

module V1
  ApprovalWorkflowApproverCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverCreateRequest").msgclass
  ApprovalWorkflowApproverCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverCreateResponse").msgclass
  ApprovalWorkflowApproverGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverGetRequest").msgclass
  ApprovalWorkflowApproverGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverGetResponse").msgclass
  ApprovalWorkflowApproverDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverDeleteRequest").msgclass
  ApprovalWorkflowApproverDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverDeleteResponse").msgclass
  ApprovalWorkflowApproverListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverListRequest").msgclass
  ApprovalWorkflowApproverListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApproverListResponse").msgclass
  ApprovalWorkflowApprover = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowApprover").msgclass
end