# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: nodes.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'protoc-gen-swagger/options/annotations_pb'
require 'options_pb'
require 'spec_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("nodes.proto", :syntax => :proto3) do
    add_message "v1.NodeCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :node, :message, 2, "v1.Node"
    end
    add_message "v1.NodeCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :node, :message, 2, "v1.Node"
      optional :token, :string, 3
      optional :rate_limit, :message, 4, "v1.RateLimitMetadata"
    end
    add_message "v1.NodeGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.NodeGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :node, :message, 2, "v1.Node"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.NodeUpdateRequest" do
      optional :meta, :message, 1, "v1.UpdateRequestMetadata"
      optional :id, :string, 2
      optional :node, :message, 3, "v1.Node"
    end
    add_message "v1.NodeUpdateResponse" do
      optional :meta, :message, 1, "v1.UpdateResponseMetadata"
      optional :node, :message, 2, "v1.Node"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.NodeDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.NodeDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.NodeListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.NodeListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :nodes, :message, 2, "v1.Node"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.Node" do
      oneof :node do
        optional :relay, :message, 1, "v1.Relay"
        optional :gateway, :message, 2, "v1.Gateway"
      end
    end
    add_message "v1.Relay" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :state, :string, 3
    end
    add_message "v1.Gateway" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :state, :string, 3
      optional :listen_address, :string, 4
      optional :bind_address, :string, 5
    end
  end
end

module V1
  NodeCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeCreateRequest").msgclass
  NodeCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeCreateResponse").msgclass
  NodeGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeGetRequest").msgclass
  NodeGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeGetResponse").msgclass
  NodeUpdateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeUpdateRequest").msgclass
  NodeUpdateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeUpdateResponse").msgclass
  NodeDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeDeleteRequest").msgclass
  NodeDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeDeleteResponse").msgclass
  NodeListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeListRequest").msgclass
  NodeListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.NodeListResponse").msgclass
  Node = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Node").msgclass
  Relay = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Relay").msgclass
  Gateway = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.Gateway").msgclass
end
