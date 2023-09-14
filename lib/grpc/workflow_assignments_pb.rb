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
# source: workflow_assignments.proto

require "google/protobuf"

require "options_pb"
require "spec_pb"
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("workflow_assignments.proto", :syntax => :proto3) do
    add_message "v1.WorkflowAssignmentsListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.WorkflowAssignmentsListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :workflow_assignments, :message, 2, "v1.WorkflowAssignment"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.WorkflowAssignment" do
      optional :workflow_id, :string, 2
      optional :resource_id, :string, 3
    end
  end
end

module V1
  WorkflowAssignmentsListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowAssignmentsListRequest").msgclass
  WorkflowAssignmentsListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowAssignmentsListResponse").msgclass
  WorkflowAssignment = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.WorkflowAssignment").msgclass
end
