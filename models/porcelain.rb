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
    
    # Token holds the bearer token used to start up nodes.
    class Token
       attr_accessor :id
       attr_accessor :token
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
    
    # Role is a domain object --
    class Role
       attr_accessor :id
       attr_accessor :name
       attr_accessor :composite
       attr_accessor :roles
    end
    
end