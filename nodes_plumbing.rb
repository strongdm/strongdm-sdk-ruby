this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'nodes_services_pb'


def Node_to_plumbing(porcelain)
    plumbing = V1::Node.new()
    if porcelain .instance_of? Relay
        plumbing.relay = Relay_to_plumbing(porcelain)
    end
    if porcelain .instance_of? Gateway
        plumbing.gateway = Gateway_to_plumbing(porcelain)
    end 
    plumbing
end

def Node_to_porcelain(plumbing)
    if plumbing.relay != nil
        return Relay_to_porcelain(plumbing.relay)
    end
    if plumbing.gateway != nil
        return Gateway_to_porcelain(plumbing.gateway)
    end
end


def Relay_to_porcelain(plumbing)
    porcelain = Relay.new()
    porcelain.id = plumbing.id
    porcelain.name = plumbing.name
    porcelain
end

def Relay_to_plumbing(porcelain)
    plumbing = V1::Relay.new()
    plumbing.id = porcelain.id unless porcelain.id == nil
    plumbing.name = porcelain.name unless porcelain.name == nil
    plumbing
    
end

def Gateway_to_porcelain(plumbing)
    porcelain = Gateway.new()
    porcelain.id = plumbing.id
    porcelain.name = plumbing.name
    porcelain.listen_address = plumbing.listen_address
    porcelain.bind_address = plumbing.bind_address
    porcelain
end

def Gateway_to_plumbing(porcelain)
    plumbing = V1::Gateway.new()
    plumbing.id = porcelain.id unless porcelain.id == nil
    plumbing.name = porcelain.name unless porcelain.name == nil
    plumbing.listen_address = porcelain.listen_address unless porcelain.listen_address == nil
    plumbing.bind_address = porcelain.bind_address unless porcelain.bind_address == nil
    plumbing
    
end

