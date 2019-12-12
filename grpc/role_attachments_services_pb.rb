# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: role_attachments.proto for package 'v1'

require 'grpc'
require 'role_attachments_pb'

module V1
  module RoleAttachments
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'v1.RoleAttachments'

      # Create registers a new RoleAttachment.
      rpc :Create, RoleAttachmentCreateRequest, RoleAttachmentCreateResponse
      # Get reads one RoleAttachment by ID.
      rpc :Get, RoleAttachmentGetRequest, RoleAttachmentGetResponse
      # Delete removes an RoleAttachment by ID.
      rpc :Delete, RoleAttachmentDeleteRequest, RoleAttachmentDeleteResponse
      # List gets a list of RoleAttachments matching a given set of criteria.
      rpc :List, RoleAttachmentListRequest, RoleAttachmentListResponse
    end

    Stub = Service.rpc_stub_class
  end
end