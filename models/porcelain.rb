module SDM
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

  class Presto
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :hostname

    attr_accessor :port_override

    attr_accessor :port

    attr_accessor :username

    attr_accessor :tls_required
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

  class AmazonES
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :endpoint

    attr_accessor :access_key

    attr_accessor :secret_access_key

    attr_accessor :region

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

    attr_accessor :certificate_authority

    attr_accessor :certificate_authority_filename

    attr_accessor :client_certificate

    attr_accessor :client_certificate_filename

    attr_accessor :client_key

    attr_accessor :client_key_filename
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

  class DynamoDB
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :endpoint

    attr_accessor :access_key

    attr_accessor :secret_access_key

    attr_accessor :region

    attr_accessor :port_override
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

  class BigQuery
    # Unique identifier of the Resource.
    attr_accessor :id
    # Unique human-readable name of the Resource.
    attr_accessor :name
    # True if the datasource is reachable and the credentials are valid.
    attr_accessor :healthy

    attr_accessor :endpoint

    attr_accessor :private_key

    attr_accessor :project

    attr_accessor :port_override

    attr_accessor :username
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

    attr_accessor :port

    attr_accessor :override_database
  end

  class MongoHybrid
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
