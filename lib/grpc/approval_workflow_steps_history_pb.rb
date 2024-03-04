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
# source: approval_workflow_steps_history.proto

require "google/protobuf"

require "google/protobuf/timestamp_pb"
require "approval_workflow_steps_pb"
require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("approval_workflow_steps_history.proto", :syntax => :proto3) do
    add_message "v1.ApprovalWorkflowStepHistoryListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.ApprovalWorkflowStepHistoryListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :history, :message, 2, "v1.ApprovalWorkflowStepHistory"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ApprovalWorkflowStepHistory" do
      optional :activity_id, :string, 1
      optional :timestamp, :message, 2, "google.protobuf.Timestamp"
      optional :approval_workflow_step, :message, 3, "v1.ApprovalWorkflowStep"
      optional :deleted_at, :message, 4, "google.protobuf.Timestamp"
    end
  end
end

module V1
  ApprovalWorkflowStepHistoryListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowStepHistoryListRequest").msgclass
  ApprovalWorkflowStepHistoryListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowStepHistoryListResponse").msgclass
  ApprovalWorkflowStepHistory = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ApprovalWorkflowStepHistory").msgclass
end
