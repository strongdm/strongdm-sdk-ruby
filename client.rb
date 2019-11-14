require_relative "./svc"

module SDM

    # Client bundles all the services together and initializes them.
    class Client
        def initialize(url)
            @nodes = Nodes.new(url)
            @roles = Roles.new(url)
        end
        attr_reader :nodes
        attr_reader :roles
    end

end