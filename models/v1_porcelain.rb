module SDM

    # CreateResponseMetadata
    class CreateResponseMetadata
       attr_accessor :affected
    end
    
    # GetResponseMetadata
    class GetResponseMetadata
       attr_accessor :found
    end
    
    # UpdateResponseMetadata
    class UpdateResponseMetadata
       attr_accessor :affected
    end
    
    # DeleteResponseMetadata
    class DeleteResponseMetadata
       attr_accessor :affected
    end
    
    # BatchUpdateResponseMetadata
    class BatchUpdateResponseMetadata
       attr_accessor :found
       attr_accessor :affected
    end
    
    # BatchDeleteResponseMetadata
    class BatchDeleteResponseMetadata
       attr_accessor :found
       attr_accessor :affected
    end
    
    # ListResponseMetadata
    class ListResponseMetadata
       attr_accessor :next_page
       attr_accessor :found
    end
    
    # NodeCreateResponse reports how the nodes were created in the system. It can
    # communicate partial successes or failures.
    class NodeCreateResponse
       attr_accessor :meta
       attr_accessor :nodes
       attr_accessor :tokens
    end
    
    # NodeGetResponse returns a requested node.
    class NodeGetResponse
       attr_accessor :meta
       attr_accessor :node
    end
    
    # NodeUpdateResponse returns the fields of a node after it has been updated by
    # a NodeUpdateRequest.
    class NodeUpdateResponse
       attr_accessor :meta
       attr_accessor :node
    end
    
    # NodeDeleteResponse returns information about a node that was deleted.
    class NodeDeleteResponse
       attr_accessor :meta
    end
    
    # NodeListResponse returns a list of nodes that meet the criteria of a
    # NodeListRequest.
    class NodeListResponse
       attr_accessor :nodes
    end
    
    # NodeBatchUpdateResponse returns a list of nodes updated via
    # NodeBatchUpdateRequest.
    class NodeBatchUpdateResponse
       attr_accessor :meta
       attr_accessor :nodes
    end
    
    # NodeBatchDeleteResponse returns information about nodes deleted via a
    # NodeBatchDeleteRequest.
    class NodeBatchDeleteResponse
       attr_accessor :meta
    end
    
    # Relay represents a StrongDM CLI installation running in relay mode.
    class Relay
       attr_accessor :id
       attr_accessor :name
    end
    
    # Gateway represents a StrongDM CLI installation running in gateway mode.
    class Gateway
       attr_accessor :id
       attr_accessor :name
       attr_accessor :listen_address
       attr_accessor :bind_address
    end
    
    # Token holds the bearer token used to start up nodes.
    class Token
       attr_accessor :id
       attr_accessor :token
    end
    
end