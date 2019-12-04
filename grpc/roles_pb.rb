# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: roles.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'protoc-gen-swagger/options/annotations_pb'
require 'options_pb'
require 'spec_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("roles.proto", :syntax => :proto3) do
    add_message "v1.RoleCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :role, :message, 2, "v1.Role"
    end
    add_message "v1.RoleCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :role, :message, 2, "v1.Role"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.RoleGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :role, :message, 2, "v1.Role"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :role, :message, 3, "v1.Role"
    end
    add_message "v1.RoleUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :role, :message, 2, "v1.Role"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.RoleDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.RoleListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :roles, :message, 2, "v1.Role"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.Role" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :composite, :bool, 3
    end
  end
end

module V1
  RoleCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleCreateRequest").msgclass
  RoleCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleCreateResponse").msgclass
  RoleGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGetRequest").msgclass
  RoleGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGetResponse").msgclass
  RoleUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleUpdateRequest").msgclass
  RoleUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleUpdateResponse").msgclass
  RoleDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleDeleteRequest").msgclass
  RoleDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleDeleteResponse").msgclass
  RoleListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleListRequest").msgclass
  RoleListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleListResponse").msgclass
  Role = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Role").msgclass
end
