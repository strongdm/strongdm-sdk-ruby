# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: resources.proto for package 'v1'

require "grpc"
require "resources_pb"

module V1
  module Resources
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.Resources"

      # Create registers a new Resource.
      rpc :Create, ResourceCreateRequest, ResourceCreateResponse
      # Get reads one Resource by ID.
      rpc :Get, ResourceGetRequest, ResourceGetResponse
      # Update patches a Resource by ID.
      rpc :Update, ResourceUpdateRequest, ResourceUpdateResponse
      # Delete removes a Resource by ID.
      rpc :Delete, ResourceDeleteRequest, ResourceDeleteResponse
      # List gets a list of Resources matching a given set of criteria.
      rpc :List, ResourceListRequest, ResourceListResponse
    end

    Stub = Service.rpc_stub_class
  end
end