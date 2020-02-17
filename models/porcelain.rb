
module SDM
  # CreateResponseMetadata is reserved for future use.
  class CreateResponseMetadata
    def initialize()
    end
  end

  # GetResponseMetadata is reserved for future use.
  class GetResponseMetadata
    def initialize()
    end
  end

  # UpdateResponseMetadata is reserved for future use.
  class UpdateResponseMetadata
    def initialize()
    end
  end

  # DeleteResponseMetadata is reserved for future use.
  class DeleteResponseMetadata
    def initialize()
    end
  end

  # RateLimitMetadata contains information about remaining requests avaialable
  # to the user over some timeframe.
  class RateLimitMetadata
    # How many total requests the user/token is authorized to make before being
    # rate limited.
    attr_accessor :limit
    # How many remaining requests out of the limit are still avaialable.
    attr_accessor :remaining
    # The time when remaining will be reset to limit.
    attr_accessor :reset_at
    # The bucket this user/token is associated with, which may be shared between
    # multiple users/tokens.
    attr_accessor :bucket

    def initialize(
                   limit: nil,
                   remaining: nil,
                   reset_at: nil,
                   bucket: nil)
      if limit != nil
        @limit = limit
      end
      if remaining != nil
        @remaining = remaining
      end
      if reset_at != nil
        @reset_at = reset_at
      end
      if bucket != nil
        @bucket = bucket
      end
    end
  end

  # AccountAttachmentCreateOptions specifies extra options for creating an
  # AccountAttachment.
  class AccountAttachmentCreateOptions
    # Overwrite clears all account grants before the attachment.
    attr_accessor :overwrite

    def initialize(
                   overwrite: nil)
      if overwrite != nil
        @overwrite = overwrite
      end
    end
  end

  # AccountAttachmentCreateResponse reports how the AccountAttachments were created in the system.
  class AccountAttachmentCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created AccountAttachment.
    attr_accessor :account_attachment
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   account_attachment: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if account_attachment != nil
        @account_attachment = account_attachment
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # AccountAttachmentGetResponse returns a requested AccountAttachment.
  class AccountAttachmentGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested AccountAttachment.
    attr_accessor :account_attachment
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   account_attachment: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if account_attachment != nil
        @account_attachment = account_attachment
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # AccountAttachmentDeleteResponse returns information about a AccountAttachment that was deleted.
  class AccountAttachmentDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # A AccountAttachment connects a composite role to another role, granting members
  # of the composite role the permissions granted to the attached role.
  class AccountAttachment
    # Unique identifier of the AccountAttachment.
    attr_accessor :id
    # The id of the account of this AccountAttachment.
    attr_accessor :account_id
    # The id of the attached role of this AccountAttachment.
    attr_accessor :role_id

    def initialize(
                   id: nil,
                   account_id: nil,
                   role_id: nil)
      if id != nil
        @id = id
      end
      if account_id != nil
        @account_id = account_id
      end
      if role_id != nil
        @role_id = role_id
      end
    end
  end

  # AccountGrantCreateResponse reports how the AccountGrants were created in the system.
  class AccountGrantCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created AccountGrant.
    attr_accessor :account_grant
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   account_grant: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if account_grant != nil
        @account_grant = account_grant
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # AccountGrantGetResponse returns a requested AccountGrant.
  class AccountGrantGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested AccountGrant.
    attr_accessor :account_grant
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   account_grant: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if account_grant != nil
        @account_grant = account_grant
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # AccountGrantDeleteResponse returns information about a AccountGrant that was deleted.
  class AccountGrantDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # A AccountGrant connects a composite role to another role, granting members
  # of the composite role the permissions granted to the attached role.
  class AccountGrant
    # Unique identifier of the AccountGrant.
    attr_accessor :id
    # The id of the composite role of this AccountGrant.
    attr_accessor :resource_id
    # The id of the attached role of this AccountGrant.
    attr_accessor :account_id
    # The timestamp when the resource will be granted. Optional. Both start_at
    # and end_at must be defined together, or not defined at all.
    attr_accessor :start_from
    # The timestamp when the resource grant will expire. Optional. Both
    # start_at and end_at must be defined together, or not defined at all.
    attr_accessor :valid_until

    def initialize(
                   id: nil,
                   resource_id: nil,
                   account_id: nil,
                   start_from: nil,
                   valid_until: nil)
      if id != nil
        @id = id
      end
      if resource_id != nil
        @resource_id = resource_id
      end
      if account_id != nil
        @account_id = account_id
      end
      if start_from != nil
        @start_from = start_from
      end
      if valid_until != nil
        @valid_until = valid_until
      end
    end
  end

  # AccountCreateResponse reports how the Accounts were created in the system.
  class AccountCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created Account.
    attr_accessor :account
    # The auth token generated for the Account. The Account will use this token to
    # authenticate with the strongDM API.
    attr_accessor :token
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   account: nil,
                   token: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if account != nil
        @account = account
      end
      if token != nil
        @token = token
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # AccountGetResponse returns a requested Account.
  class AccountGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested Account.
    attr_accessor :account
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   account: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if account != nil
        @account = account
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # AccountUpdateResponse returns the fields of a Account after it has been updated by
  # a AccountUpdateRequest.
  class AccountUpdateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The updated Account.
    attr_accessor :account
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   account: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if account != nil
        @account = account
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # AccountDeleteResponse returns information about a Account that was deleted.
  class AccountDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # A User can connect to resources they are granted directly, or granted
  # via roles.
  class User
    # Unique identifier of the User.
    attr_accessor :id
    # The User's email address. Must be unique.
    attr_accessor :email
    # The User's first name.
    attr_accessor :first_name
    # The User's last name.
    attr_accessor :last_name

    def initialize(
                   id: nil,
                   email: nil,
                   first_name: nil,
                   last_name: nil)
      if id != nil
        @id = id
      end
      if email != nil
        @email = email
      end
      if first_name != nil
        @first_name = first_name
      end
      if last_name != nil
        @last_name = last_name
      end
    end
  end

  # A Service is a service account that can connect to resources they are granted
  # directly, or granted via roles. Services are typically automated jobs.
  class Service
    # Unique identifier of the Service.
    attr_accessor :id
    # Unique human-readable name of the Service.
    attr_accessor :name

    def initialize(
                   id: nil,
                   name: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
    end
  end

  class Athena
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :access_key

    attr_accessor :secret_access_key

    attr_accessor :output

    attr_accessor :port_override

    attr_accessor :region

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   access_key: nil,
                   secret_access_key: nil,
                   output: nil,
                   port_override: nil,
                   region: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if access_key != nil
        @access_key = access_key
      end
      if secret_access_key != nil
        @secret_access_key = secret_access_key
      end
      if output != nil
        @output = output
      end
      if port_override != nil
        @port_override = port_override
      end
      if region != nil
        @region = region
      end
    end
  end

  class BigQuery
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :private_key

    attr_accessor :project

    attr_accessor :port_override

    attr_accessor :endpoint

    attr_accessor :username

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   private_key: nil,
                   project: nil,
                   port_override: nil,
                   endpoint: nil,
                   username: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if private_key != nil
        @private_key = private_key
      end
      if project != nil
        @project = project
      end
      if port_override != nil
        @port_override = port_override
      end
      if endpoint != nil
        @endpoint = endpoint
      end
      if username != nil
        @username = username
      end
    end
  end

  class Cassandra
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   port_override: nil,
                   port: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class Druid
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port_override

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   port_override: nil,
                   username: nil,
                   password: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if port_override != nil
        @port_override = port_override
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port != nil
        @port = port
      end
    end
  end

  class DynamoDB
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :access_key

    attr_accessor :secret_access_key

    attr_accessor :region

    attr_accessor :endpoint

    attr_accessor :port_override

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   access_key: nil,
                   secret_access_key: nil,
                   region: nil,
                   endpoint: nil,
                   port_override: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if access_key != nil
        @access_key = access_key
      end
      if secret_access_key != nil
        @secret_access_key = secret_access_key
      end
      if region != nil
        @region = region
      end
      if endpoint != nil
        @endpoint = endpoint
      end
      if port_override != nil
        @port_override = port_override
      end
    end
  end

  class AmazonES
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :region

    attr_accessor :secret_access_key

    attr_accessor :endpoint

    attr_accessor :access_key

    attr_accessor :port_override

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   region: nil,
                   secret_access_key: nil,
                   endpoint: nil,
                   access_key: nil,
                   port_override: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if region != nil
        @region = region
      end
      if secret_access_key != nil
        @secret_access_key = secret_access_key
      end
      if endpoint != nil
        @endpoint = endpoint
      end
      if access_key != nil
        @access_key = access_key
      end
      if port_override != nil
        @port_override = port_override
      end
    end
  end

  class Elastic
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   port_override: nil,
                   port: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class HTTPBasicAuth
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :url

    attr_accessor :healthcheck_path

    attr_accessor :username

    attr_accessor :password

    attr_accessor :headers_blacklist

    attr_accessor :default_path

    attr_accessor :subdomain

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   url: nil,
                   healthcheck_path: nil,
                   username: nil,
                   password: nil,
                   headers_blacklist: nil,
                   default_path: nil,
                   subdomain: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if url != nil
        @url = url
      end
      if healthcheck_path != nil
        @healthcheck_path = healthcheck_path
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if headers_blacklist != nil
        @headers_blacklist = headers_blacklist
      end
      if default_path != nil
        @default_path = default_path
      end
      if subdomain != nil
        @subdomain = subdomain
      end
    end
  end

  class HTTPNoAuth
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :url

    attr_accessor :healthcheck_path

    attr_accessor :headers_blacklist

    attr_accessor :default_path

    attr_accessor :subdomain

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   url: nil,
                   healthcheck_path: nil,
                   headers_blacklist: nil,
                   default_path: nil,
                   subdomain: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if url != nil
        @url = url
      end
      if healthcheck_path != nil
        @healthcheck_path = healthcheck_path
      end
      if headers_blacklist != nil
        @headers_blacklist = headers_blacklist
      end
      if default_path != nil
        @default_path = default_path
      end
      if subdomain != nil
        @subdomain = subdomain
      end
    end
  end

  class HTTPAuth
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :url

    attr_accessor :healthcheck_path

    attr_accessor :auth_header

    attr_accessor :headers_blacklist

    attr_accessor :default_path

    attr_accessor :subdomain

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   url: nil,
                   healthcheck_path: nil,
                   auth_header: nil,
                   headers_blacklist: nil,
                   default_path: nil,
                   subdomain: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if url != nil
        @url = url
      end
      if healthcheck_path != nil
        @healthcheck_path = healthcheck_path
      end
      if auth_header != nil
        @auth_header = auth_header
      end
      if headers_blacklist != nil
        @headers_blacklist = headers_blacklist
      end
      if default_path != nil
        @default_path = default_path
      end
      if subdomain != nil
        @subdomain = subdomain
      end
    end
  end

  class Kubernetes
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port

    attr_accessor :certificate_authority

    attr_accessor :certificate_authority_filename

    attr_accessor :client_certificate

    attr_accessor :client_certificate_filename

    attr_accessor :client_key

    attr_accessor :client_key_filename

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   port: nil,
                   certificate_authority: nil,
                   certificate_authority_filename: nil,
                   client_certificate: nil,
                   client_certificate_filename: nil,
                   client_key: nil,
                   client_key_filename: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if port != nil
        @port = port
      end
      if certificate_authority != nil
        @certificate_authority = certificate_authority
      end
      if certificate_authority_filename != nil
        @certificate_authority_filename = certificate_authority_filename
      end
      if client_certificate != nil
        @client_certificate = client_certificate
      end
      if client_certificate_filename != nil
        @client_certificate_filename = client_certificate_filename
      end
      if client_key != nil
        @client_key = client_key
      end
      if client_key_filename != nil
        @client_key_filename = client_key_filename
      end
    end
  end

  class KubernetesBasicAuth
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port

    attr_accessor :username

    attr_accessor :password

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   port: nil,
                   username: nil,
                   password: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if port != nil
        @port = port
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
    end
  end

  class AmazonEKS
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :endpoint

    attr_accessor :access_key

    attr_accessor :secret_access_key

    attr_accessor :certificate_authority

    attr_accessor :certificate_authority_filename

    attr_accessor :region

    attr_accessor :cluster_name

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   endpoint: nil,
                   access_key: nil,
                   secret_access_key: nil,
                   certificate_authority: nil,
                   certificate_authority_filename: nil,
                   region: nil,
                   cluster_name: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if endpoint != nil
        @endpoint = endpoint
      end
      if access_key != nil
        @access_key = access_key
      end
      if secret_access_key != nil
        @secret_access_key = secret_access_key
      end
      if certificate_authority != nil
        @certificate_authority = certificate_authority
      end
      if certificate_authority_filename != nil
        @certificate_authority_filename = certificate_authority_filename
      end
      if region != nil
        @region = region
      end
      if cluster_name != nil
        @cluster_name = cluster_name
      end
    end
  end

  class GoogleGKE
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :endpoint

    attr_accessor :certificate_authority

    attr_accessor :certificate_authority_filename

    attr_accessor :service_account_key

    attr_accessor :service_account_key_filename

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   endpoint: nil,
                   certificate_authority: nil,
                   certificate_authority_filename: nil,
                   service_account_key: nil,
                   service_account_key_filename: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if endpoint != nil
        @endpoint = endpoint
      end
      if certificate_authority != nil
        @certificate_authority = certificate_authority
      end
      if certificate_authority_filename != nil
        @certificate_authority_filename = certificate_authority_filename
      end
      if service_account_key != nil
        @service_account_key = service_account_key
      end
      if service_account_key_filename != nil
        @service_account_key_filename = service_account_key_filename
      end
    end
  end

  class KubernetesServiceAccount
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port

    attr_accessor :token

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   port: nil,
                   token: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if port != nil
        @port = port
      end
      if token != nil
        @token = token
      end
    end
  end

  class Memcached
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
  end

  class MongoLegacyHost
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :auth_database

    attr_accessor :port_override

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port

    attr_accessor :replica_set

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   auth_database: nil,
                   port_override: nil,
                   username: nil,
                   password: nil,
                   port: nil,
                   replica_set: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if auth_database != nil
        @auth_database = auth_database
      end
      if port_override != nil
        @port_override = port_override
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port != nil
        @port = port
      end
      if replica_set != nil
        @replica_set = replica_set
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class MongoLegacyReplicaset
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :auth_database

    attr_accessor :port_override

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port

    attr_accessor :replica_set

    attr_accessor :connect_to_replica

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   auth_database: nil,
                   port_override: nil,
                   username: nil,
                   password: nil,
                   port: nil,
                   replica_set: nil,
                   connect_to_replica: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if auth_database != nil
        @auth_database = auth_database
      end
      if port_override != nil
        @port_override = port_override
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port != nil
        @port = port
      end
      if replica_set != nil
        @replica_set = replica_set
      end
      if connect_to_replica != nil
        @connect_to_replica = connect_to_replica
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class MongoHost
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :auth_database

    attr_accessor :port_override

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   auth_database: nil,
                   port_override: nil,
                   username: nil,
                   password: nil,
                   port: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if auth_database != nil
        @auth_database = auth_database
      end
      if port_override != nil
        @port_override = port_override
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port != nil
        @port = port
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class MongoReplicaSet
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :auth_database

    attr_accessor :port_override

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port

    attr_accessor :replica_set

    attr_accessor :connect_to_replica

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   auth_database: nil,
                   port_override: nil,
                   username: nil,
                   password: nil,
                   port: nil,
                   replica_set: nil,
                   connect_to_replica: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if auth_database != nil
        @auth_database = auth_database
      end
      if port_override != nil
        @port_override = port_override
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port != nil
        @port = port
      end
      if replica_set != nil
        @replica_set = replica_set
      end
      if connect_to_replica != nil
        @connect_to_replica = connect_to_replica
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class Mysql
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
  end

  class AuroraMysql
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
  end

  class Clustrix
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
  end

  class Maria
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
  end

  class Memsql
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
  end

  class Oracle
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port

    attr_accessor :port_override

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port: nil,
                   port_override: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port != nil
        @port = port
      end
      if port_override != nil
        @port_override = port_override
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class Postgres
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :override_database

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil,
                   override_database: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if override_database != nil
        @override_database = override_database
      end
    end
  end

  class AuroraPostgres
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :override_database

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil,
                   override_database: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if override_database != nil
        @override_database = override_database
      end
    end
  end

  class Greenplum
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :override_database

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil,
                   override_database: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if override_database != nil
        @override_database = override_database
      end
    end
  end

  class Cockroach
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :override_database

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil,
                   override_database: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if override_database != nil
        @override_database = override_database
      end
    end
  end

  class Redshift
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :override_database

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil,
                   override_database: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if override_database != nil
        @override_database = override_database
      end
    end
  end

  class Presto
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :username

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   port: nil,
                   username: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if username != nil
        @username = username
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class RDP
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
  end

  class Redis
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port_override

    attr_accessor :password

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   port_override: nil,
                   password: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if port_override != nil
        @port_override = port_override
      end
      if password != nil
        @password = password
      end
      if port != nil
        @port = port
      end
    end
  end

  class ElasticacheRedis
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port_override

    attr_accessor :password

    attr_accessor :port

    attr_accessor :tls_required

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   port_override: nil,
                   password: nil,
                   port: nil,
                   tls_required: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if port_override != nil
        @port_override = port_override
      end
      if password != nil
        @password = password
      end
      if port != nil
        @port = port
      end
      if tls_required != nil
        @tls_required = tls_required
      end
    end
  end

  class Snowflake
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :schema

    attr_accessor :port_override

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   schema: nil,
                   port_override: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if schema != nil
        @schema = schema
      end
      if port_override != nil
        @port_override = port_override
      end
    end
  end

  class SQLServer
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :database

    attr_accessor :port_override

    attr_accessor :schema

    attr_accessor :port

    attr_accessor :override_database

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   database: nil,
                   port_override: nil,
                   schema: nil,
                   port: nil,
                   override_database: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if database != nil
        @database = database
      end
      if port_override != nil
        @port_override = port_override
      end
      if schema != nil
        @schema = schema
      end
      if port != nil
        @port = port
      end
      if override_database != nil
        @override_database = override_database
      end
    end
  end

  class SSH
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :port

    attr_accessor :public_key

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   port: nil,
                   public_key: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if port != nil
        @port = port
      end
      if public_key != nil
        @public_key = public_key
      end
    end
  end

  class Sybase
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :password

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   port_override: nil,
                   port: nil,
                   password: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if password != nil
        @password = password
      end
    end
  end

  class SybaseIQ
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :password

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   port_override: nil,
                   port: nil,
                   password: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
      if password != nil
        @password = password
      end
    end
  end

  class Teradata
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :username

    attr_accessor :password

    attr_accessor :port_override

    attr_accessor :port

    def initialize(
                   id: nil,
                   name: nil,
                   healthy: nil,
                   hostname: nil,
                   username: nil,
                   password: nil,
                   port_override: nil,
                   port: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if healthy != nil
        @healthy = healthy
      end
      if hostname != nil
        @hostname = hostname
      end
      if username != nil
        @username = username
      end
      if password != nil
        @password = password
      end
      if port_override != nil
        @port_override = port_override
      end
      if port != nil
        @port = port
      end
    end
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

    def initialize(
                   meta: nil,
                   node: nil,
                   token: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if node != nil
        @node = node
      end
      if token != nil
        @token = token
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # NodeGetResponse returns a requested Node.
  class NodeGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested Node.
    attr_accessor :node
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   node: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if node != nil
        @node = node
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
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

    def initialize(
                   meta: nil,
                   node: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if node != nil
        @node = node
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # NodeDeleteResponse returns information about a Node that was deleted.
  class NodeDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
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

    def initialize(
                   id: nil,
                   name: nil,
                   state: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if state != nil
        @state = state
      end
    end
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

    def initialize(
                   id: nil,
                   name: nil,
                   state: nil,
                   listen_address: nil,
                   bind_address: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if state != nil
        @state = state
      end
      if listen_address != nil
        @listen_address = listen_address
      end
      if bind_address != nil
        @bind_address = bind_address
      end
    end
  end

  # ResourceCreateResponse reports how the Resources were created in the system.
  class ResourceCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created Resource.
    attr_accessor :resource
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   resource: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if resource != nil
        @resource = resource
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # ResourceGetResponse returns a requested Resource.
  class ResourceGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested Resource.
    attr_accessor :resource
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   resource: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if resource != nil
        @resource = resource
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # ResourceUpdateResponse returns the fields of a Resource after it has been updated by
  # a ResourceUpdateRequest.
  class ResourceUpdateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The updated Resource.
    attr_accessor :resource
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   resource: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if resource != nil
        @resource = resource
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # ResourceDeleteResponse returns information about a Resource that was deleted.
  class ResourceDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # RoleAttachmentCreateResponse reports how the RoleAttachments were created in the system.
  class RoleAttachmentCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created RoleAttachment.
    attr_accessor :role_attachment
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   role_attachment: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if role_attachment != nil
        @role_attachment = role_attachment
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # RoleAttachmentGetResponse returns a requested RoleAttachment.
  class RoleAttachmentGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested RoleAttachment.
    attr_accessor :role_attachment
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   role_attachment: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if role_attachment != nil
        @role_attachment = role_attachment
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # RoleAttachmentDeleteResponse returns information about a RoleAttachment that was deleted.
  class RoleAttachmentDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # A RoleAttachment connects a composite role to another role, granting members
  # of the composite role the permissions granted to the attached role.
  class RoleAttachment
    # Unique identifier of the RoleAttachment.
    attr_accessor :id
    # The id of the composite role of this RoleAttachment.
    attr_accessor :composite_role_id
    # The id of the attached role of this RoleAttachment.
    attr_accessor :attached_role_id

    def initialize(
                   id: nil,
                   composite_role_id: nil,
                   attached_role_id: nil)
      if id != nil
        @id = id
      end
      if composite_role_id != nil
        @composite_role_id = composite_role_id
      end
      if attached_role_id != nil
        @attached_role_id = attached_role_id
      end
    end
  end

  # RoleGrantCreateResponse reports how the RoleGrants were created in the system.
  class RoleGrantCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created RoleGrant.
    attr_accessor :role_grant
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   role_grant: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if role_grant != nil
        @role_grant = role_grant
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # RoleGrantGetResponse returns a requested RoleGrant.
  class RoleGrantGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested RoleGrant.
    attr_accessor :role_grant
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   role_grant: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if role_grant != nil
        @role_grant = role_grant
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # RoleGrantDeleteResponse returns information about a RoleGrant that was deleted.
  class RoleGrantDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # A RoleGrant connects a resource to a role, granting members of the role
  # access to it.
  class RoleGrant
    # Unique identifier of the RoleGrant.
    attr_accessor :id
    # The id of the resource of this RoleGrant.
    attr_accessor :resource_id
    # The id of the attached role of this RoleGrant.
    attr_accessor :role_id

    def initialize(
                   id: nil,
                   resource_id: nil,
                   role_id: nil)
      if id != nil
        @id = id
      end
      if resource_id != nil
        @resource_id = resource_id
      end
      if role_id != nil
        @role_id = role_id
      end
    end
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

    def initialize(
                   meta: nil,
                   role: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if role != nil
        @role = role
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # RoleGetResponse returns a requested Role.
  class RoleGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested Role.
    attr_accessor :role
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   role: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if role != nil
        @role = role
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
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

    def initialize(
                   meta: nil,
                   role: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if role != nil
        @role = role
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
  end

  # RoleDeleteResponse returns information about a Role that was deleted.
  class RoleDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit

    def initialize(
                   meta: nil,
                   rate_limit: nil)
      if meta != nil
        @meta = meta
      end
      if rate_limit != nil
        @rate_limit = rate_limit
      end
    end
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

    def initialize(
                   id: nil,
                   name: nil,
                   composite: nil)
      if id != nil
        @id = id
      end
      if name != nil
        @name = name
      end
      if composite != nil
        @composite = composite
      end
    end
  end
end
