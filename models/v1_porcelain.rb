# Node
class Node
    attr_accessor :relay
    attr_accessor :gateway
end

# Relay
class Relay
    attr_accessor :id
    attr_accessor :name
end

# Gateway
class Gateway
    attr_accessor :id
    attr_accessor :name
    attr_accessor :listen_address
    attr_accessor :bind_address
end

