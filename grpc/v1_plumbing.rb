require_relative './nodes_pb' # import GRPC plumbing
require_relative '../models/v1_porcelain' # import models porcelain


module SDM
    module Plumbing

        def self.node_create_response_to_porcelain(plumbing)
            porcelain = NodeCreateResponse.new()
            porcelain.meta = plumbing.meta
            porcelain.nodes = plumbing.nodes
            porcelain.tokens = plumbing.tokens
            porcelain
        end

        def self.node_create_response_to_plumbing(porcelain)
            plumbing = V1::NodeCreateResponse.new()
            plumbing.meta = porcelain.meta unless porcelain.meta == nil
            plumbing.nodes = porcelain.nodes unless porcelain.nodes == nil
            plumbing.tokens = porcelain.tokens unless porcelain.tokens == nil
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
            porcelain
        end

        def self.relay_to_plumbing(porcelain)
            plumbing = V1::Relay.new()
            plumbing.id = porcelain.id unless porcelain.id == nil
            plumbing.name = porcelain.name unless porcelain.name == nil
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
            porcelain.listen_address = plumbing.listen_address
            porcelain.bind_address = plumbing.bind_address
            porcelain
        end

        def self.gateway_to_plumbing(porcelain)
            plumbing = V1::Gateway.new()
            plumbing.id = porcelain.id unless porcelain.id == nil
            plumbing.name = porcelain.name unless porcelain.name == nil
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

        def self.token_to_porcelain(plumbing)
            porcelain = Token.new()
            porcelain.id = plumbing.id
            porcelain.token = plumbing.token
            porcelain
        end

        def self.token_to_plumbing(porcelain)
            plumbing = V1::Token.new()
            plumbing.id = porcelain.id unless porcelain.id == nil
            plumbing.token = porcelain.token unless porcelain.token == nil
            plumbing
        end

        def self.repeated_token_to_plumbing(porcelains)
            items = Array.new
            porcelains.each do |porcelain|
                plumbing = token_to_plumbing(porcelain)
                items.append(plumbing)
            end
            items
        end

        def self.repeated_token_to_porcelain(plumbings)
            items = Array.new
            plumbings.each do |plumbing|
                porcelain = token_to_porcelain(plumbing)
                items.append(porcelain)
            end
            items
        end

    end
end

