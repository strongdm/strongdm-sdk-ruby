module SDM

    # NodeCreateResponse
    class NodeCreateResponse
       attr_accessor :meta
       attr_accessor :nodes
       attr_accessor :tokens
    end

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

    # Token
    class Token
       attr_accessor :id
       attr_accessor :token
    end

end