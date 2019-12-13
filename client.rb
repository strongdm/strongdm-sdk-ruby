require_relative "./svc"
require "base64"

module SDM

  # Client bundles all the services together and initializes them.
  class Client
    # Creates a new strongDM API client. The `address` parameter expects a hostname/port tuple.
    def initialize(address, api_access_key, api_secret_key)
      @api_access_key = api_access_key
      @api_secret_key = Base64.strict_decode64(api_secret_key)
      @nodes = Nodes.new(address, self)
      @role_attachments = RoleAttachments.new(address, self)
      @roles = Roles.new(address, self)

      @_test_options = Hash.new
    end

    def get_metadata(method_name, req)
      return { 'x-sdm-authentication': @api_access_key, 'x-sdm-signature': self.sign(method_name, req.to_proto) }
    end

    def sign(method_name, msg_bytes)
      current_date = Time.new
      date = sprintf("%04d-%02d-%02d", current_date.year, current_date.month, current_date.day)

      signing_key = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, @api_secret_key, date)
      signing_key = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, signing_key, "sdm_api_v1")

      sha_req = Digest::SHA256.new
      sha_req << method_name
      sha_req << "\n"
      sha_req << msg_bytes
      request_hash = sha_req.digest

      return Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, signing_key, request_hash))
    end

    # API authentication token (read-only).
    attr_reader :api_access_key
    # Nodes are proxies in the strongDM network. They come in two flavors: relays,
    # which communicate with resources, and gateways, which communicate with
    # clients.
    attr_reader :nodes
    # RoleAttachments represent relationships between composite roles and the roles
    # that make up those composite roles. When a composite role is attached to another
    # role, the permissions granted to members of the composite role are augmented to
    # include the permissions granted to members of the attached role.
    attr_reader :role_attachments
    # Roles are tools for controlling user access to resources. Each Role holds a
    # list of resources which they grant access to. Composite roles are a special
    # type of Role which have no resource associations of their own, but instead
    # grant access to the combined resources associated with a set of child roles.
    # Each user can be a member of one Role or composite role.
    attr_reader :roles

    attr_reader :_test_options
  end
end
