module SDM

    # CreateResponseMetadata is reserved for future use.
    class CreateResponseMetadata
    end
    
    # GetResponseMetadata is reserved for future use.
    class GetResponseMetadata
    end
    
    # UpdateResponseMetadata is reserved for future use.
    class UpdateResponseMetadata
    end
    
    # DeleteResponseMetadata is reserved for future use.
    class DeleteResponseMetadata
    end
    
    # NodeCreateResponse reports how the nodes were created in the system. It can
    # communicate partial successes or failures.
    class NodeCreateResponse
       attr_accessor :meta
       attr_accessor :node
       attr_accessor :token
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
    
    # RoleCreateResponse reports how the Roles were created in the system. It can
    # communicate partial successes or failures.
    class RoleCreateResponse
       attr_accessor :meta
       attr_accessor :role
    end
    
    # RoleGetResponse returns a requested Role.
    class RoleGetResponse
       attr_accessor :meta
       attr_accessor :role
    end
    
    # RoleUpdateResponse returns the fields of a Role after it has been updated by
    # a RoleUpdateRequest.
    class RoleUpdateResponse
       attr_accessor :meta
       attr_accessor :role
    end
    
    # RoleDeleteResponse returns information about a Role that was deleted.
    class RoleDeleteResponse
       attr_accessor :meta
    end
    
    # A Role grants users access to a set of resources. Composite roles have no
    # resource associations of their own, but instead grant access to the combined
    # resources of their child roles.
    class Role
       attr_accessor :id
       attr_accessor :name
       attr_accessor :composite
    end
    
end