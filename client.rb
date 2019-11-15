require_relative "./svc"

module SDM

    # Client bundles all the services together and initializes them.
    class Client
        def initialize(url, apiKey)
            @nodes = Nodes.new(url, apiKey)
            @roles = Roles.new(url, apiKey)
        end
        attr_reader :nodes
        attr_reader :roles
    end

end