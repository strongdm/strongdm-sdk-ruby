module SDM

  # RPCError is a generic RPC error
  class RPCError < StandardError
    attr_reader :code

    def initialize(msg, code)
      @code = code
      super(msg)
    end
  end

  # DeadlineExceededError indicates an RPC call timed out
  class DeadlineExceededError < RPCError
    def initialize(msg)
      super(msg, 4)
    end
  end

  # AlreadyExistsError is used when an entity already exists in the system
  class AlreadyExistsError < RPCError
    def initialize(msg)
      super(msg, 6)
    end
  end

  # NotFoundError is used when an entity does not exist in the system
  class NotFoundError < RPCError
    def initialize(msg)
      super(msg, 5)
    end
  end

  # BadRequestError identifies a bad request sent by the client
  class BadRequestError < RPCError
    def initialize(msg)
      super(msg, 3)
    end
  end

  # AuthenticationError is used to specify an authentication failure condition
  class AuthenticationError < RPCError
    def initialize(msg)
      super(msg, 16)
    end
  end

  # PermissionError is used to specify a permissions violation
  class PermissionError < RPCError
    def initialize(msg)
      super(msg, 7)
    end
  end

  # InternalError is used to specify an internal system error
  class InternalError < RPCError
    def initialize(msg)
      super(msg, 13)
    end
  end

  # RateLimitError is used for rate limit excess condition
  class RateLimitError < RPCError
    attr_reader :rate_limit

    def initialize(msg, rate_limit)
      @rate_limit = rate_limit
      super(msg, 8)
    end
  end
end
