module SDM
    class Error < StandardError
    end

    # AlreadyExistsError is used when an entity already exists in the system
    class AlreadyExistsError < Error
        attr_reader :entities
        def initialize(msg, entities)
            @entities = entities
            super(msg)
        end
    end

    # NotFoundError is used when an entity does not exist in the system
    class NotFoundError < Error
        attr_reader :entities
        def initialize(msg, entities)
            @entities = entities
            super(msg)
        end
    end

    # BadRequestError identifies a bad request sent by the client
    class BadRequestError < Error
        def initialize(msg)
            super(msg)
        end
    end

    # AuthenticationError is used to specify an authentication failure condition
    class AuthenticationError < Error
        def initialize(msg)
            super(msg)
        end
    end

    # PermissionError is used to specify a permissions violation
    class PermissionError < Error
        def initialize(msg)
            super(msg)
        end
    end

    # InternalError is used to specify an internal system error
    class InternalError < Error
        def initialize(msg)
            super(msg)
        end
    end

    # RateLimitError is used for rate limit excess condition
    class RateLimitError < Error
        def initialize(msg)
            super(msg)
        end
    end

    # RPCError is a generic RPC error
    class RPCError < Error
        attr_reader :code
        def initialize(msg, code)
            @code = code
            super(msg)
        end
    end
end