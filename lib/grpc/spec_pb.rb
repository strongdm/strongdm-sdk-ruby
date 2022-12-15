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
# source: spec.proto

require "google/protobuf"

require "options_pb"
require "google/protobuf/timestamp_pb"
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("spec.proto", :syntax => :proto3) do
    add_message "v1.AlreadyExistsError" do
      optional :entity, :string, 1
    end
    add_message "v1.NotFoundError" do
      optional :entity, :string, 1
    end
    add_message "v1.BadRequestError" do
    end
    add_message "v1.AuthenticationError" do
    end
    add_message "v1.PermissionError" do
    end
    add_message "v1.InternalError" do
    end
    add_message "v1.RateLimitError" do
      optional :rate_limit, :message, 1, "v1.RateLimitMetadata"
    end
    add_message "v1.CreateRequestMetadata" do
    end
    add_message "v1.CreateResponseMetadata" do
    end
    add_message "v1.GetRequestMetadata" do
      optional :snapshot_at, :message, 1, "google.protobuf.Timestamp"
    end
    add_message "v1.GetResponseMetadata" do
    end
    add_message "v1.UpdateRequestMetadata" do
    end
    add_message "v1.UpdateResponseMetadata" do
    end
    add_message "v1.DeleteRequestMetadata" do
    end
    add_message "v1.DeleteResponseMetadata" do
    end
    add_message "v1.ListRequestMetadata" do
      optional :cursor, :string, 1
      optional :page, :int32, 2
      optional :limit, :int32, 3
      optional :order_by, :string, 4
      optional :snapshot_at, :message, 5, "google.protobuf.Timestamp"
    end
    add_message "v1.ListResponseMetadata" do
      optional :next_cursor, :string, 1
      optional :total, :int32, 2
    end
    add_message "v1.RateLimitMetadata" do
      optional :limit, :int64, 1
      optional :remaining, :int64, 2
      optional :reset_at, :message, 3, "google.protobuf.Timestamp"
      optional :bucket, :string, 4
    end
    add_message "v1.GenericRequestMetadata" do
    end
    add_message "v1.GenericResponseMetadata" do
    end
  end
end

module V1
  AlreadyExistsError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AlreadyExistsError").msgclass
  NotFoundError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NotFoundError").msgclass
  BadRequestError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.BadRequestError").msgclass
  AuthenticationError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AuthenticationError").msgclass
  PermissionError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.PermissionError").msgclass
  InternalError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.InternalError").msgclass
  RateLimitError = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RateLimitError").msgclass
  CreateRequestMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CreateRequestMetadata").msgclass
  CreateResponseMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CreateResponseMetadata").msgclass
  GetRequestMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.GetRequestMetadata").msgclass
  GetResponseMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.GetResponseMetadata").msgclass
  UpdateRequestMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.UpdateRequestMetadata").msgclass
  UpdateResponseMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.UpdateResponseMetadata").msgclass
  DeleteRequestMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.DeleteRequestMetadata").msgclass
  DeleteResponseMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.DeleteResponseMetadata").msgclass
  ListRequestMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ListRequestMetadata").msgclass
  ListResponseMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ListResponseMetadata").msgclass
  RateLimitMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RateLimitMetadata").msgclass
  GenericRequestMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.GenericRequestMetadata").msgclass
  GenericResponseMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.GenericResponseMetadata").msgclass
end
