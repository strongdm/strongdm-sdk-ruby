require_relative './nodes_pb' # import GRPC plumbing
require_relative '../models/v1_porcelain' # import models porcelain

def node_to_plumbing(porcelain)
    plumbing = V1::Node.new()
    if porcelain .instance_of? Relay
        plumbing.relay = relay_to_plumbing(porcelain)
    end
    if porcelain .instance_of? Gateway
        plumbing.gateway = gateway_to_plumbing(porcelain)
    end
    plumbing
end

def node_to_porcelain(plumbing)
    if plumbing.relay != nil
        return relay_to_porcelain(plumbing.relay)
    end
    if plumbing.gateway != nil
        return gateway_to_porcelain(plumbing.gateway)
    end
end

def repeated_node_to_plumbing(porcelains)
    items = Array.new
    porcelains.each do |porcelain|
        plumbing = node_to_plumbing(porcelain)
        items.append(plumbing)
    end
    items
end

def relay_to_porcelain(plumbing)
    porcelain = Relay.new()
    porcelain.id = plumbing.id
    porcelain.name = plumbing.name
    porcelain
end

def relay_to_plumbing(porcelain)
    plumbing = V1::Relay.new()
    plumbing.id = porcelain.id unless porcelain.id == nil
    plumbing.name = porcelain.name unless porcelain.name == nil
    plumbing
end

def repeated_relay_to_plumbing(porcelains)
    items = Array.new
    porcelains.each do |porcelain|
        plumbing = relay_to_plumbing(porcelain)
        items.append(plumbing)
    end
    items
end

def gateway_to_porcelain(plumbing)
    porcelain = Gateway.new()
    porcelain.id = plumbing.id
    porcelain.name = plumbing.name
    porcelain.listen_address = plumbing.listen_address
    porcelain.bind_address = plumbing.bind_address
    porcelain
end

def gateway_to_plumbing(porcelain)
    plumbing = V1::Gateway.new()
    plumbing.id = porcelain.id unless porcelain.id == nil
    plumbing.name = porcelain.name unless porcelain.name == nil
    plumbing.listen_address = porcelain.listen_address unless porcelain.listen_address == nil
    plumbing.bind_address = porcelain.bind_address unless porcelain.bind_address == nil
    plumbing
end

def repeated_gateway_to_plumbing(porcelains)
    items = Array.new
    porcelains.each do |porcelain|
        plumbing = gateway_to_plumbing(porcelain)
        items.append(plumbing)
    end
    items
end

