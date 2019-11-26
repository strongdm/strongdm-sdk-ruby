require_relative "./svc"

module SDM

    # Client bundles all the services together and initializes them.
    class Client
        # Creates a new strongDM API client. The `address` parameter expects a hostname/port tuple.
        def initialize(address, apiKey)
            @api_key = apiKey
            @nodes = Nodes.new(address, self)
            @roles = Roles.new(address, self)

            @_test_options = Hash.new
        end

        # API authentication token (read-only).
        attr_reader :api_key
        # Nodes are proxies in the strongDM network. They come in two flavors: relays,
        # which communicate with resources, and gateways, which communicate with
        # clients.
        attr_reader :nodes
        # Roles are tools for controlling user access to resources. Each Role holds a
        # list of resources which they grant access to. Composite roles are a special
        # type of Role which have no resource associations of their own, but instead
        # grant access to the combined resources associated with a set of child roles.
        # Each user can be a member of one Role or composite role.
        attr_reader :roles

        attr_reader :_test_options
    end

end