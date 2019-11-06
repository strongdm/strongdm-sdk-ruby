require_relative "./svc"

module SDM

    # Client bundles all the services together and initializes them.
    class Client
        def initialize(url)
            @nodes = Nodes.new(url)
        end
        attr_reader :nodes
    end

end