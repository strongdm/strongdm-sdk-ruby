require 'grpc'
require 'google/protobuf/well_known_types'
require_relative './options_pb'
require_relative './spec_pb'
require_relative './nodes_pb'
require_relative './roles_pb'
require_relative '../models/porcelain'
require_relative '../errors/errors'


module SDM
    module Plumbing

        def self.create_response_metadata_to_porcelain(plumbing)
            porcelain = CreateResponseMetadata.new()
            porcelain
        end

        def self.create_response_metadata_to_plumbing(porcelain)
            plumbing = V1::CreateResponseMetadata.new()
            plumbing
        end

        def self.repeated_create_response_metadata_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = create_response_metadata_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_create_response_metadata_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = create_response_metadata_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.get_response_metadata_to_porcelain(plumbing)
            porcelain = GetResponseMetadata.new()
            porcelain
        end

        def self.get_response_metadata_to_plumbing(porcelain)
            plumbing = V1::GetResponseMetadata.new()
            plumbing
        end

        def self.repeated_get_response_metadata_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = get_response_metadata_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_get_response_metadata_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = get_response_metadata_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.update_response_metadata_to_porcelain(plumbing)
            porcelain = UpdateResponseMetadata.new()
            porcelain
        end

        def self.update_response_metadata_to_plumbing(porcelain)
            plumbing = V1::UpdateResponseMetadata.new()
            plumbing
        end

        def self.repeated_update_response_metadata_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = update_response_metadata_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_update_response_metadata_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = update_response_metadata_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.delete_response_metadata_to_porcelain(plumbing)
            porcelain = DeleteResponseMetadata.new()
            porcelain
        end

        def self.delete_response_metadata_to_plumbing(porcelain)
            plumbing = V1::DeleteResponseMetadata.new()
            plumbing
        end

        def self.repeated_delete_response_metadata_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = delete_response_metadata_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_delete_response_metadata_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = delete_response_metadata_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.node_create_response_to_porcelain(plumbing)
            porcelain = NodeCreateResponse.new()
            porcelain.meta = create_response_metadata_to_porcelain(plumbing.meta)
            porcelain.node = node_to_porcelain(plumbing.node)
            porcelain.token = plumbing.token
            porcelain
        end

        def self.node_create_response_to_plumbing(porcelain)
            plumbing = V1::NodeCreateResponse.new()
            plumbing.meta = create_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing.node = node_to_plumbing(porcelain.node) unless porcelain.node == nil
            plumbing.token = porcelain.token unless porcelain.token == nil
            plumbing
        end

        def self.repeated_node_create_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = node_create_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_node_create_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = node_create_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.node_get_response_to_porcelain(plumbing)
            porcelain = NodeGetResponse.new()
            porcelain.meta = get_response_metadata_to_porcelain(plumbing.meta)
            porcelain.node = node_to_porcelain(plumbing.node)
            porcelain
        end

        def self.node_get_response_to_plumbing(porcelain)
            plumbing = V1::NodeGetResponse.new()
            plumbing.meta = get_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing.node = node_to_plumbing(porcelain.node) unless porcelain.node == nil
            plumbing
        end

        def self.repeated_node_get_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = node_get_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_node_get_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = node_get_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.node_update_response_to_porcelain(plumbing)
            porcelain = NodeUpdateResponse.new()
            porcelain.meta = update_response_metadata_to_porcelain(plumbing.meta)
            porcelain.node = node_to_porcelain(plumbing.node)
            porcelain
        end

        def self.node_update_response_to_plumbing(porcelain)
            plumbing = V1::NodeUpdateResponse.new()
            plumbing.meta = update_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing.node = node_to_plumbing(porcelain.node) unless porcelain.node == nil
            plumbing
        end

        def self.repeated_node_update_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = node_update_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_node_update_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = node_update_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.node_delete_response_to_porcelain(plumbing)
            porcelain = NodeDeleteResponse.new()
            porcelain.meta = delete_response_metadata_to_porcelain(plumbing.meta)
            porcelain
        end

        def self.node_delete_response_to_plumbing(porcelain)
            plumbing = V1::NodeDeleteResponse.new()
            plumbing.meta = delete_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing
        end

        def self.repeated_node_delete_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = node_delete_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_node_delete_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = node_delete_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.node_to_plumbing(porcelain)
            plumbing = V1::Node.new()
            if porcelain .instance_of? Relay
                plumbing.relay = relay_to_plumbing(porcelain)
            end
            if porcelain .instance_of? Gateway
                plumbing.gateway = gateway_to_plumbing(porcelain)
            end
            plumbing
        end

        def self.node_to_porcelain(plumbing)
            if plumbing.relay != nil
                return relay_to_porcelain(plumbing.relay)
            end
            if plumbing.gateway != nil
                return gateway_to_porcelain(plumbing.gateway)
            end
        end

        def self.repeated_node_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = node_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_node_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = node_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.relay_to_porcelain(plumbing)
            porcelain = Relay.new()
            porcelain.id = plumbing.id
            porcelain.name = plumbing.name
            porcelain.state = plumbing.state
            porcelain
        end

        def self.relay_to_plumbing(porcelain)
            plumbing = V1::Relay.new()
            plumbing.id = porcelain.id unless porcelain.id == nil
            plumbing.name = porcelain.name unless porcelain.name == nil
            plumbing.state = porcelain.state unless porcelain.state == nil
            plumbing
        end

        def self.repeated_relay_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = relay_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_relay_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = relay_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.gateway_to_porcelain(plumbing)
            porcelain = Gateway.new()
            porcelain.id = plumbing.id
            porcelain.name = plumbing.name
            porcelain.state = plumbing.state
            porcelain.listen_address = plumbing.listen_address
            porcelain.bind_address = plumbing.bind_address
            porcelain
        end

        def self.gateway_to_plumbing(porcelain)
            plumbing = V1::Gateway.new()
            plumbing.id = porcelain.id unless porcelain.id == nil
            plumbing.name = porcelain.name unless porcelain.name == nil
            plumbing.state = porcelain.state unless porcelain.state == nil
            plumbing.listen_address = porcelain.listen_address unless porcelain.listen_address == nil
            plumbing.bind_address = porcelain.bind_address unless porcelain.bind_address == nil
            plumbing
        end

        def self.repeated_gateway_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = gateway_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_gateway_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = gateway_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.role_create_response_to_porcelain(plumbing)
            porcelain = RoleCreateResponse.new()
            porcelain.meta = create_response_metadata_to_porcelain(plumbing.meta)
            porcelain.role = role_to_porcelain(plumbing.role)
            porcelain
        end

        def self.role_create_response_to_plumbing(porcelain)
            plumbing = V1::RoleCreateResponse.new()
            plumbing.meta = create_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing.role = role_to_plumbing(porcelain.role) unless porcelain.role == nil
            plumbing
        end

        def self.repeated_role_create_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = role_create_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_role_create_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = role_create_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.role_get_response_to_porcelain(plumbing)
            porcelain = RoleGetResponse.new()
            porcelain.meta = get_response_metadata_to_porcelain(plumbing.meta)
            porcelain.role = role_to_porcelain(plumbing.role)
            porcelain
        end

        def self.role_get_response_to_plumbing(porcelain)
            plumbing = V1::RoleGetResponse.new()
            plumbing.meta = get_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing.role = role_to_plumbing(porcelain.role) unless porcelain.role == nil
            plumbing
        end

        def self.repeated_role_get_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = role_get_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_role_get_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = role_get_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.role_update_response_to_porcelain(plumbing)
            porcelain = RoleUpdateResponse.new()
            porcelain.meta = update_response_metadata_to_porcelain(plumbing.meta)
            porcelain.role = role_to_porcelain(plumbing.role)
            porcelain
        end

        def self.role_update_response_to_plumbing(porcelain)
            plumbing = V1::RoleUpdateResponse.new()
            plumbing.meta = update_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing.role = role_to_plumbing(porcelain.role) unless porcelain.role == nil
            plumbing
        end

        def self.repeated_role_update_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = role_update_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_role_update_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = role_update_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.role_delete_response_to_porcelain(plumbing)
            porcelain = RoleDeleteResponse.new()
            porcelain.meta = delete_response_metadata_to_porcelain(plumbing.meta)
            porcelain
        end

        def self.role_delete_response_to_plumbing(porcelain)
            plumbing = V1::RoleDeleteResponse.new()
            plumbing.meta = delete_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
            plumbing
        end

        def self.repeated_role_delete_response_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = role_delete_response_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_role_delete_response_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = role_delete_response_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

        def self.role_to_porcelain(plumbing)
            porcelain = Role.new()
            porcelain.id = plumbing.id
            porcelain.name = plumbing.name
            porcelain.composite = plumbing.composite
            porcelain
        end

        def self.role_to_plumbing(porcelain)
            plumbing = V1::Role.new()
            plumbing.id = porcelain.id unless porcelain.id == nil
            plumbing.name = porcelain.name unless porcelain.name == nil
            plumbing.composite = porcelain.composite unless porcelain.composite == nil
            plumbing
        end

        def self.repeated_role_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = role_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_role_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = role_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end


        def self.error_to_porcelain(err)
            if not err .is_a? GRPC::BadStatus
                return RPCError.new(err, 2) # Unknown
            end

            if err.code == 4
                return DeadlineExceededError.new(err.message)
            end

            status = err.to_rpc_status
            if status == nil
                return RPCError.new(err.message, err.code)
            end
            status.details.each do |detail|
                case detail.type_url
                    # AlreadyExistsError is used when an entity already exists in the system
                    when "type.googleapis.com/v1.AlreadyExistsError"
                        deserialized = detail.unpack V1::AlreadyExistsError
                        return AlreadyExistsError.new(err.message, deserialized.entity)
        
                    # NotFoundError is used when an entity does not exist in the system
                    when "type.googleapis.com/v1.NotFoundError"
                        deserialized = detail.unpack V1::NotFoundError
                        return NotFoundError.new(err.message, deserialized.entity)
        
                    # BadRequestError identifies a bad request sent by the client
                    when "type.googleapis.com/v1.BadRequestError"
                        deserialized = detail.unpack V1::BadRequestError
                        return BadRequestError.new(err.message)
        
                    # AuthenticationError is used to specify an authentication failure condition
                    when "type.googleapis.com/v1.AuthenticationError"
                        deserialized = detail.unpack V1::AuthenticationError
                        return AuthenticationError.new(err.message)
        
                    # PermissionError is used to specify a permissions violation
                    when "type.googleapis.com/v1.PermissionError"
                        deserialized = detail.unpack V1::PermissionError
                        return PermissionError.new(err.message)
        
                    # InternalError is used to specify an internal system error
                    when "type.googleapis.com/v1.InternalError"
                        deserialized = detail.unpack V1::InternalError
                        return InternalError.new(err.message)
        
                    # RateLimitError is used for rate limit excess condition
                    when "type.googleapis.com/v1.RateLimitError"
                        deserialized = detail.unpack V1::RateLimitError
                        return RateLimitError.new(err.message)
        
                end
            end
            return RPCError.new(err.message, err.code)
        end
    end
end
