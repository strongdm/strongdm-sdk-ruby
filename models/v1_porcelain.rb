module SDM

    # ListResponseMetadata
    class ListResponseMetadata
       attr_accessor :next_page
       attr_accessor :found
    end
    
    # NodeCreateResponse
    class NodeCreateResponse
       attr_accessor :nodes
       attr_accessor :tokens
    end
    
    # NodeGetResponse
    class NodeGetResponse
       attr_accessor :node
    end
    
    # NodeUpdateResponse
    class NodeUpdateResponse
       attr_accessor :node
    end
    
    # NodeDeleteResponse
    class NodeDeleteResponse
       attr_accessor :meta
    end
    
    # NodeListResponse
    class NodeListResponse
       attr_accessor :meta
       attr_accessor :nodes
    end
    
    # NodeBatchUpdateResponse
    class NodeBatchUpdateResponse
    end
    
    # NodeBatchDeleteResponse
    class NodeBatchDeleteResponse
       attr_accessor :meta
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