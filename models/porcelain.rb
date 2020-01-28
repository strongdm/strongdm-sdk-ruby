
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
  end

  # AccountGetResponse returns a requested Account.
  class AccountGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested Account.
    attr_accessor :account
    # Rate limit information.
    attr_accessor :rate_limit
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
  end

  # AccountDeleteResponse returns information about a Account that was deleted.
  class AccountDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit
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
  end

  # A Service is a service account that can connect to resources they are granted
  # directly, or granted via roles. Services are typically automated jobs.
  class Service
    # Unique identifier of the Service.
    attr_accessor :id
    # Unique human-readable name of the Service.
    attr_accessor :name
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

  # ResourceCreateResponse reports how the Resources were created in the system.
  class ResourceCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created Resource.
    attr_accessor :resource
    # Rate limit information.
    attr_accessor :rate_limit
  end

  # ResourceGetResponse returns a requested Resource.
  class ResourceGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested Resource.
    attr_accessor :resource
    # Rate limit information.
    attr_accessor :rate_limit
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
  end

  # ResourceDeleteResponse returns information about a Resource that was deleted.
  class ResourceDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit
  end

  # RoleAttachmentCreateResponse reports how the RoleAttachments were created in the system.
  class RoleAttachmentCreateResponse
    # Reserved for future use.
    attr_accessor :meta
    # The created RoleAttachment.
    attr_accessor :role_attachment
    # Rate limit information.
    attr_accessor :rate_limit
  end

  # RoleAttachmentGetResponse returns a requested RoleAttachment.
  class RoleAttachmentGetResponse
    # Reserved for future use.
    attr_accessor :meta
    # The requested RoleAttachment.
    attr_accessor :role_attachment
    # Rate limit information.
    attr_accessor :rate_limit
  end

  # RoleAttachmentDeleteResponse returns information about a RoleAttachment that was deleted.
  class RoleAttachmentDeleteResponse
    # Reserved for future use.
    attr_accessor :meta
    # Rate limit information.
    attr_accessor :rate_limit
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
