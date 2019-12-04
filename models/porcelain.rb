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
    
    # RateLimitMetadata contains information about remaining requests avaialable
    # to the user over some timeframe.
    class RateLimitMetadata
    end
    
    # NodeCreateResponse reports how the Nodes were created in the system.
    class NodeCreateResponse
        # Reserved for future use.
       attr_accessor :meta
        # The created Node.
       attr_accessor :node
        # The auth token generated for the Node. The Node will use this token to
        # authenticate with the strongDM API.
       attr_accessor :token
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # NodeGetResponse returns a requested Node.
    class NodeGetResponse
        # Reserved for future use.
       attr_accessor :meta
        # The requested Node.
       attr_accessor :node
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # NodeUpdateResponse returns the fields of a Node after it has been updated by
    # a NodeUpdateRequest.
    class NodeUpdateResponse
        # Reserved for future use.
       attr_accessor :meta
        # The updated Node.
       attr_accessor :node
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # NodeDeleteResponse returns information about a Node that was deleted.
    class NodeDeleteResponse
        # Reserved for future use.
       attr_accessor :meta
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # Relay represents a StrongDM CLI installation running in relay mode.
    class Relay
        # Unique identifier of the Relay.
       attr_accessor :id
        # Unique human-readable name of the Relay.
       attr_accessor :name
        # The current state of the relay. One of: "new", "verifying_restart",
        # "restarting", "started", "stopped", "dead", "unknown",
       attr_accessor :state
    end
    
    # Gateway represents a StrongDM CLI installation running in gateway mode.
    class Gateway
        # Unique identifier of the Relay.
       attr_accessor :id
        # Unique human-readable name of the Relay.
       attr_accessor :name
        # The current state of the gateway. One of: "new", "verifying_restart",
        # "restarting", "started", "stopped", "dead", "unknown",
       attr_accessor :state
        # The public hostname/port tuple at which the gateway will be accessible to clients.
       attr_accessor :listen_address
        # The hostname/port tuple which the gateway daemon will bind to.
       attr_accessor :bind_address
    end
    
    # RoleCreateResponse reports how the Roles were created in the system. It can
    # communicate partial successes or failures.
    class RoleCreateResponse
        # Reserved for future use.
       attr_accessor :meta
        # The created Role.
       attr_accessor :role
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # RoleGetResponse returns a requested Role.
    class RoleGetResponse
        # Reserved for future use.
       attr_accessor :meta
        # The requested Role.
       attr_accessor :role
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # RoleUpdateResponse returns the fields of a Role after it has been updated by
    # a RoleUpdateRequest.
    class RoleUpdateResponse
        # Reserved for future use.
       attr_accessor :meta
        # The updated Role.
       attr_accessor :role
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # RoleDeleteResponse returns information about a Role that was deleted.
    class RoleDeleteResponse
        # Reserved for future use.
       attr_accessor :meta
        # Rate limit information.
       attr_accessor :rate_limit
    end
    
    # A Role grants users access to a set of resources. Composite roles have no
    # resource associations of their own, but instead grant access to the combined
    # resources of their child roles.
    class Role
        # Unique identifier of the Role.
       attr_accessor :id
        # Unique human-readable name of the Role.
       attr_accessor :name
        # True if the Role is a composite role.
       attr_accessor :composite
    end
    
end