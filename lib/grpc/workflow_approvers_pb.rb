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
# source: workflow_approvers.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("workflow_approvers.proto", :syntax => :proto3) do
    add_message "v1.WorkflowApproversCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :workflow_approver, :message, 2, "v1.WorkflowApprover"
    end
    add_message "v1.WorkflowApproversCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :workflow_approver, :message, 2, "v1.WorkflowApprover"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.WorkflowApproverGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.WorkflowApproverGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :workflow_approver, :message, 2, "v1.WorkflowApprover"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.WorkflowApproversDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.WorkflowApproversDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.WorkflowApproversListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.WorkflowApproversListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :workflow_approvers, :message, 2, "v1.WorkflowApprover"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.WorkflowApprover" do
      optional :id, :string, 1
      optional :workflow_id, :string, 2
      optional :account_id, :string, 3
      optional :role_id, :string, 4
    end
  end
end

module V1
  WorkflowApproversCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproversCreateRequest").msgclass
  WorkflowApproversCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproversCreateResponse").msgclass
  WorkflowApproverGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproverGetRequest").msgclass
  WorkflowApproverGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproverGetResponse").msgclass
  WorkflowApproversDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproversDeleteRequest").msgclass
  WorkflowApproversDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproversDeleteResponse").msgclass
  WorkflowApproversListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproversListRequest").msgclass
  WorkflowApproversListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApproversListResponse").msgclass
  WorkflowApprover = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowApprover").msgclass
end
