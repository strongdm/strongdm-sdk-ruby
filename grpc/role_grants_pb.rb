# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: role_grants.proto

require "google/protobuf"

require "google/api/annotations_pb"
require "protoc-gen-swagger/options/annotations_pb"
require "google/protobuf/timestamp_pb"
require "options_pb"
require "spec_pb"
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("role_grants.proto", :syntax => :proto3) do
    add_message "v1.RoleGrantCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :role_grant, :message, 2, "v1.RoleGrant"
    end
    add_message "v1.RoleGrantCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :role_grant, :message, 2, "v1.RoleGrant"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleGrantGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.RoleGrantGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :role_grant, :message, 2, "v1.RoleGrant"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleGrantDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.RoleGrantDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleGrantListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.RoleGrantListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :role_grants, :message, 2, "v1.RoleGrant"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.RoleGrant" do
      optional :id, :string, 1
      optional :resource_id, :string, 2
      optional :role_id, :string, 3
    end
  end
end

module V1
  RoleGrantCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantCreateRequest").msgclass
  RoleGrantCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantCreateResponse").msgclass
  RoleGrantGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantGetRequest").msgclass
  RoleGrantGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantGetResponse").msgclass
  RoleGrantDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantDeleteRequest").msgclass
  RoleGrantDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantDeleteResponse").msgclass
  RoleGrantListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantListRequest").msgclass
  RoleGrantListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrantListResponse").msgclass
  RoleGrant = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.RoleGrant").msgclass
end