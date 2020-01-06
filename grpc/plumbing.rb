require "grpc"
require "google/protobuf/well_known_types"
require "json"
require_relative "./options_pb"
require_relative "./drivers_pb"
require_relative "./spec_pb"
require_relative "./nodes_pb"
require_relative "./resources_pb"
require_relative "./role_attachments_pb"
require_relative "./roles_pb"
require_relative "../models/porcelain"
require_relative "../errors/errors"

module SDM
  module Plumbing
    def self.quote_filter_args(filter, *args)
      parts = (filter + " ").split("?")
      if parts.length() != args.length() + 1
        raise BadRequestError.new("incorrect number of replacements")
      end
      b = ""
      parts.each_with_index do |v, i|
        b += v
        if i < args.length()
          s = args[i].to_s()
          s = JSON.dump(s)
          b += s
        end
      end
      return b
    end

    def self.timestamp_to_porcelain(t)
      return Time.at(t.seconds + t.nanos * (10 ** -9))
    end

    def self.timestamp_to_plumbing(t)
      return Google::Protobuf::Timestamp.new(seconds: t.to_i, nanos: t.nsec)
    end

    def self.resource_to_plumbing(porcelain)
      plumbing = V1::Resource.new()
      if porcelain.instance_of? Sybase
        plumbing.sybase = sybase_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Presto
        plumbing.presto = presto_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Teradata
        plumbing.teradata = teradata_to_plumbing(porcelain)
      end
      if porcelain.instance_of? AmazonES
        plumbing.amazon_es = amazon_es_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Elastic
        plumbing.elastic = elastic_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Redis
        plumbing.redis = redis_to_plumbing(porcelain)
      end
      if porcelain.instance_of? ElasticacheRedis
        plumbing.elasticache_redis = elasticache_redis_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Kubernetes
        plumbing.kubernetes = kubernetes_to_plumbing(porcelain)
      end
      if porcelain.instance_of? KubernetesBasicAuth
        plumbing.kubernetes_basic_auth = kubernetes_basic_auth_to_plumbing(porcelain)
      end
      if porcelain.instance_of? AmazonEKS
        plumbing.amazon_eks = amazon_eks_to_plumbing(porcelain)
      end
      if porcelain.instance_of? GoogleGKE
        plumbing.google_gke = google_gke_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Oracle
        plumbing.oracle = oracle_to_plumbing(porcelain)
      end
      if porcelain.instance_of? DynamoDB
        plumbing.dynamo_db = dynamo_db_to_plumbing(porcelain)
      end
      if porcelain.instance_of? RDP
        plumbing.rdp = rdp_to_plumbing(porcelain)
      end
      if porcelain.instance_of? BigQuery
        plumbing.big_query = big_query_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Snowflake
        plumbing.snowflake = snowflake_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Memcached
        plumbing.memcached = memcached_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Postgres
        plumbing.postgres = postgres_to_plumbing(porcelain)
      end
      if porcelain.instance_of? AuroraPostgres
        plumbing.aurora_postgres = aurora_postgres_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Greenplum
        plumbing.greenplum = greenplum_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Cockroach
        plumbing.cockroach = cockroach_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Redshift
        plumbing.redshift = redshift_to_plumbing(porcelain)
      end
      if porcelain.instance_of? SSH
        plumbing.ssh = ssh_to_plumbing(porcelain)
      end
      if porcelain.instance_of? HTTPBasicAuth
        plumbing.http_basic_auth = http_basic_auth_to_plumbing(porcelain)
      end
      if porcelain.instance_of? HTTPNoAuth
        plumbing.http_no_auth = http_no_auth_to_plumbing(porcelain)
      end
      if porcelain.instance_of? HTTPAuth
        plumbing.http_auth = http_auth_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Cassandra
        plumbing.cassandra = cassandra_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Mysql
        plumbing.mysql = mysql_to_plumbing(porcelain)
      end
      if porcelain.instance_of? AuroraMysql
        plumbing.aurora_mysql = aurora_mysql_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Clustrix
        plumbing.clustrix = clustrix_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Maria
        plumbing.maria = maria_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Memsql
        plumbing.memsql = memsql_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Druid
        plumbing.druid = druid_to_plumbing(porcelain)
      end
      if porcelain.instance_of? SQLServer
        plumbing.sql_server = sql_server_to_plumbing(porcelain)
      end
      if porcelain.instance_of? MongoLegacyHost
        plumbing.mongo_legacy_host = mongo_legacy_host_to_plumbing(porcelain)
      end
      if porcelain.instance_of? MongoLegacyReplicaset
        plumbing.mongo_legacy_replicaset = mongo_legacy_replicaset_to_plumbing(porcelain)
      end
      if porcelain.instance_of? MongoHost
        plumbing.mongo_host = mongo_host_to_plumbing(porcelain)
      end
      if porcelain.instance_of? MongoReplicaSet
        plumbing.mongo_replica_set = mongo_replica_set_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Athena
        plumbing.athena = athena_to_plumbing(porcelain)
      end
      plumbing
    end

    def self.resource_to_porcelain(plumbing)
      if plumbing.sybase != nil
        return sybase_to_porcelain(plumbing.sybase)
      end
      if plumbing.presto != nil
        return presto_to_porcelain(plumbing.presto)
      end
      if plumbing.teradata != nil
        return teradata_to_porcelain(plumbing.teradata)
      end
      if plumbing.amazon_es != nil
        return amazon_es_to_porcelain(plumbing.amazon_es)
      end
      if plumbing.elastic != nil
        return elastic_to_porcelain(plumbing.elastic)
      end
      if plumbing.redis != nil
        return redis_to_porcelain(plumbing.redis)
      end
      if plumbing.elasticache_redis != nil
        return elasticache_redis_to_porcelain(plumbing.elasticache_redis)
      end
      if plumbing.kubernetes != nil
        return kubernetes_to_porcelain(plumbing.kubernetes)
      end
      if plumbing.kubernetes_basic_auth != nil
        return kubernetes_basic_auth_to_porcelain(plumbing.kubernetes_basic_auth)
      end
      if plumbing.amazon_eks != nil
        return amazon_eks_to_porcelain(plumbing.amazon_eks)
      end
      if plumbing.google_gke != nil
        return google_gke_to_porcelain(plumbing.google_gke)
      end
      if plumbing.oracle != nil
        return oracle_to_porcelain(plumbing.oracle)
      end
      if plumbing.dynamo_db != nil
        return dynamo_db_to_porcelain(plumbing.dynamo_db)
      end
      if plumbing.rdp != nil
        return rdp_to_porcelain(plumbing.rdp)
      end
      if plumbing.big_query != nil
        return big_query_to_porcelain(plumbing.big_query)
      end
      if plumbing.snowflake != nil
        return snowflake_to_porcelain(plumbing.snowflake)
      end
      if plumbing.memcached != nil
        return memcached_to_porcelain(plumbing.memcached)
      end
      if plumbing.postgres != nil
        return postgres_to_porcelain(plumbing.postgres)
      end
      if plumbing.aurora_postgres != nil
        return aurora_postgres_to_porcelain(plumbing.aurora_postgres)
      end
      if plumbing.greenplum != nil
        return greenplum_to_porcelain(plumbing.greenplum)
      end
      if plumbing.cockroach != nil
        return cockroach_to_porcelain(plumbing.cockroach)
      end
      if plumbing.redshift != nil
        return redshift_to_porcelain(plumbing.redshift)
      end
      if plumbing.ssh != nil
        return ssh_to_porcelain(plumbing.ssh)
      end
      if plumbing.http_basic_auth != nil
        return http_basic_auth_to_porcelain(plumbing.http_basic_auth)
      end
      if plumbing.http_no_auth != nil
        return http_no_auth_to_porcelain(plumbing.http_no_auth)
      end
      if plumbing.http_auth != nil
        return http_auth_to_porcelain(plumbing.http_auth)
      end
      if plumbing.cassandra != nil
        return cassandra_to_porcelain(plumbing.cassandra)
      end
      if plumbing.mysql != nil
        return mysql_to_porcelain(plumbing.mysql)
      end
      if plumbing.aurora_mysql != nil
        return aurora_mysql_to_porcelain(plumbing.aurora_mysql)
      end
      if plumbing.clustrix != nil
        return clustrix_to_porcelain(plumbing.clustrix)
      end
      if plumbing.maria != nil
        return maria_to_porcelain(plumbing.maria)
      end
      if plumbing.memsql != nil
        return memsql_to_porcelain(plumbing.memsql)
      end
      if plumbing.druid != nil
        return druid_to_porcelain(plumbing.druid)
      end
      if plumbing.sql_server != nil
        return sql_server_to_porcelain(plumbing.sql_server)
      end
      if plumbing.mongo_legacy_host != nil
        return mongo_legacy_host_to_porcelain(plumbing.mongo_legacy_host)
      end
      if plumbing.mongo_legacy_replicaset != nil
        return mongo_legacy_replicaset_to_porcelain(plumbing.mongo_legacy_replicaset)
      end
      if plumbing.mongo_host != nil
        return mongo_host_to_porcelain(plumbing.mongo_host)
      end
      if plumbing.mongo_replica_set != nil
        return mongo_replica_set_to_porcelain(plumbing.mongo_replica_set)
      end
      if plumbing.athena != nil
        return athena_to_porcelain(plumbing.athena)
      end
    end
    def self.repeated_resource_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = resource_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_resource_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = resource_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.sybase_to_porcelain(plumbing)
      porcelain = Sybase.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.password = plumbing.password
      porcelain
    end

    def self.sybase_to_plumbing(porcelain)
      plumbing = V1::Sybase.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing
    end
    def self.repeated_sybase_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = sybase_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_sybase_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = sybase_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.presto_to_porcelain(plumbing)
      porcelain = Presto.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.username = plumbing.username
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.presto_to_plumbing(porcelain)
      plumbing = V1::Presto.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_presto_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = presto_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_presto_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = presto_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.teradata_to_porcelain(plumbing)
      porcelain = Teradata.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.teradata_to_plumbing(porcelain)
      plumbing = V1::Teradata.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_teradata_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = teradata_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_teradata_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = teradata_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.amazon_es_to_porcelain(plumbing)
      porcelain = AmazonES.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.region = plumbing.region
      porcelain.secret_access_key = plumbing.secret_access_key
      porcelain.endpoint = plumbing.endpoint
      porcelain.access_key = plumbing.access_key
      porcelain.port_override = plumbing.port_override
      porcelain
    end

    def self.amazon_es_to_plumbing(porcelain)
      plumbing = V1::AmazonES.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.region = porcelain.region unless porcelain.region == nil
      plumbing.secret_access_key = porcelain.secret_access_key unless porcelain.secret_access_key == nil
      plumbing.endpoint = porcelain.endpoint unless porcelain.endpoint == nil
      plumbing.access_key = porcelain.access_key unless porcelain.access_key == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing
    end
    def self.repeated_amazon_es_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = amazon_es_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_amazon_es_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = amazon_es_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.elastic_to_porcelain(plumbing)
      porcelain = Elastic.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.elastic_to_plumbing(porcelain)
      plumbing = V1::Elastic.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_elastic_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = elastic_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_elastic_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = elastic_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.redis_to_porcelain(plumbing)
      porcelain = Redis.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.port_override = plumbing.port_override
      porcelain.password = plumbing.password
      porcelain.port = plumbing.port
      porcelain
    end

    def self.redis_to_plumbing(porcelain)
      plumbing = V1::Redis.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_redis_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = redis_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_redis_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = redis_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.elasticache_redis_to_porcelain(plumbing)
      porcelain = ElasticacheRedis.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.port_override = plumbing.port_override
      porcelain.password = plumbing.password
      porcelain.port = plumbing.port
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.elasticache_redis_to_plumbing(porcelain)
      plumbing = V1::ElasticacheRedis.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_elasticache_redis_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = elasticache_redis_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_elasticache_redis_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = elasticache_redis_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.kubernetes_to_porcelain(plumbing)
      porcelain = Kubernetes.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.port = plumbing.port
      porcelain.certificate_authority = plumbing.certificate_authority
      porcelain.certificate_authority_filename = plumbing.certificate_authority_filename
      porcelain.client_certificate = plumbing.client_certificate
      porcelain.client_certificate_filename = plumbing.client_certificate_filename
      porcelain.client_key = plumbing.client_key
      porcelain.client_key_filename = plumbing.client_key_filename
      porcelain
    end

    def self.kubernetes_to_plumbing(porcelain)
      plumbing = V1::Kubernetes.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.certificate_authority = porcelain.certificate_authority unless porcelain.certificate_authority == nil
      plumbing.certificate_authority_filename = porcelain.certificate_authority_filename unless porcelain.certificate_authority_filename == nil
      plumbing.client_certificate = porcelain.client_certificate unless porcelain.client_certificate == nil
      plumbing.client_certificate_filename = porcelain.client_certificate_filename unless porcelain.client_certificate_filename == nil
      plumbing.client_key = porcelain.client_key unless porcelain.client_key == nil
      plumbing.client_key_filename = porcelain.client_key_filename unless porcelain.client_key_filename == nil
      plumbing
    end
    def self.repeated_kubernetes_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = kubernetes_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_kubernetes_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = kubernetes_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.kubernetes_basic_auth_to_porcelain(plumbing)
      porcelain = KubernetesBasicAuth.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.port = plumbing.port
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain
    end

    def self.kubernetes_basic_auth_to_plumbing(porcelain)
      plumbing = V1::KubernetesBasicAuth.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing
    end
    def self.repeated_kubernetes_basic_auth_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = kubernetes_basic_auth_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_kubernetes_basic_auth_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = kubernetes_basic_auth_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.amazon_eks_to_porcelain(plumbing)
      porcelain = AmazonEKS.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.endpoint = plumbing.endpoint
      porcelain.access_key = plumbing.access_key
      porcelain.secret_access_key = plumbing.secret_access_key
      porcelain.certificate_authority = plumbing.certificate_authority
      porcelain.certificate_authority_filename = plumbing.certificate_authority_filename
      porcelain.region = plumbing.region
      porcelain.cluster_name = plumbing.cluster_name
      porcelain
    end

    def self.amazon_eks_to_plumbing(porcelain)
      plumbing = V1::AmazonEKS.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.endpoint = porcelain.endpoint unless porcelain.endpoint == nil
      plumbing.access_key = porcelain.access_key unless porcelain.access_key == nil
      plumbing.secret_access_key = porcelain.secret_access_key unless porcelain.secret_access_key == nil
      plumbing.certificate_authority = porcelain.certificate_authority unless porcelain.certificate_authority == nil
      plumbing.certificate_authority_filename = porcelain.certificate_authority_filename unless porcelain.certificate_authority_filename == nil
      plumbing.region = porcelain.region unless porcelain.region == nil
      plumbing.cluster_name = porcelain.cluster_name unless porcelain.cluster_name == nil
      plumbing
    end
    def self.repeated_amazon_eks_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = amazon_eks_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_amazon_eks_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = amazon_eks_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.google_gke_to_porcelain(plumbing)
      porcelain = GoogleGKE.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.endpoint = plumbing.endpoint
      porcelain.certificate_authority = plumbing.certificate_authority
      porcelain.certificate_authority_filename = plumbing.certificate_authority_filename
      porcelain.service_account_key = plumbing.service_account_key
      porcelain.service_account_key_filename = plumbing.service_account_key_filename
      porcelain
    end

    def self.google_gke_to_plumbing(porcelain)
      plumbing = V1::GoogleGKE.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.endpoint = porcelain.endpoint unless porcelain.endpoint == nil
      plumbing.certificate_authority = porcelain.certificate_authority unless porcelain.certificate_authority == nil
      plumbing.certificate_authority_filename = porcelain.certificate_authority_filename unless porcelain.certificate_authority_filename == nil
      plumbing.service_account_key = porcelain.service_account_key unless porcelain.service_account_key == nil
      plumbing.service_account_key_filename = porcelain.service_account_key_filename unless porcelain.service_account_key_filename == nil
      plumbing
    end
    def self.repeated_google_gke_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = google_gke_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_google_gke_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = google_gke_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.oracle_to_porcelain(plumbing)
      porcelain = Oracle.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port = plumbing.port
      porcelain.port_override = plumbing.port_override
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.oracle_to_plumbing(porcelain)
      plumbing = V1::Oracle.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_oracle_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = oracle_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_oracle_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = oracle_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.dynamo_db_to_porcelain(plumbing)
      porcelain = DynamoDB.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.access_key = plumbing.access_key
      porcelain.secret_access_key = plumbing.secret_access_key
      porcelain.region = plumbing.region
      porcelain.endpoint = plumbing.endpoint
      porcelain.port_override = plumbing.port_override
      porcelain
    end

    def self.dynamo_db_to_plumbing(porcelain)
      plumbing = V1::DynamoDB.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.access_key = porcelain.access_key unless porcelain.access_key == nil
      plumbing.secret_access_key = porcelain.secret_access_key unless porcelain.secret_access_key == nil
      plumbing.region = porcelain.region unless porcelain.region == nil
      plumbing.endpoint = porcelain.endpoint unless porcelain.endpoint == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing
    end
    def self.repeated_dynamo_db_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = dynamo_db_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_dynamo_db_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = dynamo_db_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.rdp_to_porcelain(plumbing)
      porcelain = RDP.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.rdp_to_plumbing(porcelain)
      plumbing = V1::RDP.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_rdp_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = rdp_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_rdp_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = rdp_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.big_query_to_porcelain(plumbing)
      porcelain = BigQuery.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.private_key = plumbing.private_key
      porcelain.project = plumbing.project
      porcelain.port_override = plumbing.port_override
      porcelain.endpoint = plumbing.endpoint
      porcelain.username = plumbing.username
      porcelain
    end

    def self.big_query_to_plumbing(porcelain)
      plumbing = V1::BigQuery.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.private_key = porcelain.private_key unless porcelain.private_key == nil
      plumbing.project = porcelain.project unless porcelain.project == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.endpoint = porcelain.endpoint unless porcelain.endpoint == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing
    end
    def self.repeated_big_query_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = big_query_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_big_query_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = big_query_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.snowflake_to_porcelain(plumbing)
      porcelain = Snowflake.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.schema = plumbing.schema
      porcelain.port_override = plumbing.port_override
      porcelain
    end

    def self.snowflake_to_plumbing(porcelain)
      plumbing = V1::Snowflake.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.schema = porcelain.schema unless porcelain.schema == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing
    end
    def self.repeated_snowflake_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = snowflake_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_snowflake_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = snowflake_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.memcached_to_porcelain(plumbing)
      porcelain = Memcached.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.memcached_to_plumbing(porcelain)
      plumbing = V1::Memcached.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_memcached_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = memcached_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_memcached_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = memcached_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.postgres_to_porcelain(plumbing)
      porcelain = Postgres.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.override_database = plumbing.override_database
      porcelain
    end

    def self.postgres_to_plumbing(porcelain)
      plumbing = V1::Postgres.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.override_database = porcelain.override_database unless porcelain.override_database == nil
      plumbing
    end
    def self.repeated_postgres_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = postgres_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_postgres_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = postgres_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.aurora_postgres_to_porcelain(plumbing)
      porcelain = AuroraPostgres.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.override_database = plumbing.override_database
      porcelain
    end

    def self.aurora_postgres_to_plumbing(porcelain)
      plumbing = V1::AuroraPostgres.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.override_database = porcelain.override_database unless porcelain.override_database == nil
      plumbing
    end
    def self.repeated_aurora_postgres_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = aurora_postgres_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_aurora_postgres_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = aurora_postgres_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.greenplum_to_porcelain(plumbing)
      porcelain = Greenplum.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.override_database = plumbing.override_database
      porcelain
    end

    def self.greenplum_to_plumbing(porcelain)
      plumbing = V1::Greenplum.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.override_database = porcelain.override_database unless porcelain.override_database == nil
      plumbing
    end
    def self.repeated_greenplum_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = greenplum_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_greenplum_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = greenplum_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.cockroach_to_porcelain(plumbing)
      porcelain = Cockroach.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.override_database = plumbing.override_database
      porcelain
    end

    def self.cockroach_to_plumbing(porcelain)
      plumbing = V1::Cockroach.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.override_database = porcelain.override_database unless porcelain.override_database == nil
      plumbing
    end
    def self.repeated_cockroach_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = cockroach_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_cockroach_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = cockroach_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.redshift_to_porcelain(plumbing)
      porcelain = Redshift.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.override_database = plumbing.override_database
      porcelain
    end

    def self.redshift_to_plumbing(porcelain)
      plumbing = V1::Redshift.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.override_database = porcelain.override_database unless porcelain.override_database == nil
      plumbing
    end
    def self.repeated_redshift_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = redshift_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_redshift_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = redshift_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.ssh_to_porcelain(plumbing)
      porcelain = SSH.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.port = plumbing.port
      porcelain.public_key = plumbing.public_key
      porcelain
    end

    def self.ssh_to_plumbing(porcelain)
      plumbing = V1::SSH.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.public_key = porcelain.public_key unless porcelain.public_key == nil
      plumbing
    end
    def self.repeated_ssh_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = ssh_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_ssh_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = ssh_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.http_basic_auth_to_porcelain(plumbing)
      porcelain = HTTPBasicAuth.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.url = plumbing.url
      porcelain.healthcheck_path = plumbing.healthcheck_path
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.headers_blacklist = plumbing.headers_blacklist
      porcelain.default_path = plumbing.default_path
      porcelain.subdomain = plumbing.subdomain
      porcelain
    end

    def self.http_basic_auth_to_plumbing(porcelain)
      plumbing = V1::HTTPBasicAuth.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.url = porcelain.url unless porcelain.url == nil
      plumbing.healthcheck_path = porcelain.healthcheck_path unless porcelain.healthcheck_path == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.headers_blacklist = porcelain.headers_blacklist unless porcelain.headers_blacklist == nil
      plumbing.default_path = porcelain.default_path unless porcelain.default_path == nil
      plumbing.subdomain = porcelain.subdomain unless porcelain.subdomain == nil
      plumbing
    end
    def self.repeated_http_basic_auth_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = http_basic_auth_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_http_basic_auth_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = http_basic_auth_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.http_no_auth_to_porcelain(plumbing)
      porcelain = HTTPNoAuth.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.url = plumbing.url
      porcelain.healthcheck_path = plumbing.healthcheck_path
      porcelain.headers_blacklist = plumbing.headers_blacklist
      porcelain.default_path = plumbing.default_path
      porcelain.subdomain = plumbing.subdomain
      porcelain
    end

    def self.http_no_auth_to_plumbing(porcelain)
      plumbing = V1::HTTPNoAuth.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.url = porcelain.url unless porcelain.url == nil
      plumbing.healthcheck_path = porcelain.healthcheck_path unless porcelain.healthcheck_path == nil
      plumbing.headers_blacklist = porcelain.headers_blacklist unless porcelain.headers_blacklist == nil
      plumbing.default_path = porcelain.default_path unless porcelain.default_path == nil
      plumbing.subdomain = porcelain.subdomain unless porcelain.subdomain == nil
      plumbing
    end
    def self.repeated_http_no_auth_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = http_no_auth_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_http_no_auth_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = http_no_auth_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.http_auth_to_porcelain(plumbing)
      porcelain = HTTPAuth.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.url = plumbing.url
      porcelain.healthcheck_path = plumbing.healthcheck_path
      porcelain.auth_header = plumbing.auth_header
      porcelain.headers_blacklist = plumbing.headers_blacklist
      porcelain.default_path = plumbing.default_path
      porcelain.subdomain = plumbing.subdomain
      porcelain
    end

    def self.http_auth_to_plumbing(porcelain)
      plumbing = V1::HTTPAuth.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.url = porcelain.url unless porcelain.url == nil
      plumbing.healthcheck_path = porcelain.healthcheck_path unless porcelain.healthcheck_path == nil
      plumbing.auth_header = porcelain.auth_header unless porcelain.auth_header == nil
      plumbing.headers_blacklist = porcelain.headers_blacklist unless porcelain.headers_blacklist == nil
      plumbing.default_path = porcelain.default_path unless porcelain.default_path == nil
      plumbing.subdomain = porcelain.subdomain unless porcelain.subdomain == nil
      plumbing
    end
    def self.repeated_http_auth_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = http_auth_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_http_auth_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = http_auth_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.cassandra_to_porcelain(plumbing)
      porcelain = Cassandra.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.cassandra_to_plumbing(porcelain)
      plumbing = V1::Cassandra.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_cassandra_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = cassandra_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_cassandra_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = cassandra_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.mysql_to_porcelain(plumbing)
      porcelain = Mysql.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.mysql_to_plumbing(porcelain)
      plumbing = V1::Mysql.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_mysql_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = mysql_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_mysql_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = mysql_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.aurora_mysql_to_porcelain(plumbing)
      porcelain = AuroraMysql.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.aurora_mysql_to_plumbing(porcelain)
      plumbing = V1::AuroraMysql.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_aurora_mysql_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = aurora_mysql_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_aurora_mysql_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = aurora_mysql_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.clustrix_to_porcelain(plumbing)
      porcelain = Clustrix.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.clustrix_to_plumbing(porcelain)
      plumbing = V1::Clustrix.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_clustrix_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = clustrix_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_clustrix_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = clustrix_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.maria_to_porcelain(plumbing)
      porcelain = Maria.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.maria_to_plumbing(porcelain)
      plumbing = V1::Maria.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_maria_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = maria_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_maria_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = maria_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.memsql_to_porcelain(plumbing)
      porcelain = Memsql.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.port = plumbing.port
      porcelain
    end

    def self.memsql_to_plumbing(porcelain)
      plumbing = V1::Memsql.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_memsql_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = memsql_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_memsql_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = memsql_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.druid_to_porcelain(plumbing)
      porcelain = Druid.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.port_override = plumbing.port_override
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port = plumbing.port
      porcelain
    end

    def self.druid_to_plumbing(porcelain)
      plumbing = V1::Druid.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing
    end
    def self.repeated_druid_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = druid_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_druid_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = druid_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.sql_server_to_porcelain(plumbing)
      porcelain = SQLServer.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port_override = plumbing.port_override
      porcelain.schema = plumbing.schema
      porcelain.port = plumbing.port
      porcelain.override_database = plumbing.override_database
      porcelain
    end

    def self.sql_server_to_plumbing(porcelain)
      plumbing = V1::SQLServer.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.schema = porcelain.schema unless porcelain.schema == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.override_database = porcelain.override_database unless porcelain.override_database == nil
      plumbing
    end
    def self.repeated_sql_server_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = sql_server_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_sql_server_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = sql_server_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.mongo_legacy_host_to_porcelain(plumbing)
      porcelain = MongoLegacyHost.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.auth_database = plumbing.auth_database
      porcelain.port_override = plumbing.port_override
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port = plumbing.port
      porcelain.replica_set = plumbing.replica_set
      porcelain.connect_to_replica = plumbing.connect_to_replica
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.mongo_legacy_host_to_plumbing(porcelain)
      plumbing = V1::MongoLegacyHost.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.auth_database = porcelain.auth_database unless porcelain.auth_database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.replica_set = porcelain.replica_set unless porcelain.replica_set == nil
      plumbing.connect_to_replica = porcelain.connect_to_replica unless porcelain.connect_to_replica == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_mongo_legacy_host_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = mongo_legacy_host_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_mongo_legacy_host_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = mongo_legacy_host_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.mongo_legacy_replicaset_to_porcelain(plumbing)
      porcelain = MongoLegacyReplicaset.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.auth_database = plumbing.auth_database
      porcelain.port_override = plumbing.port_override
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port = plumbing.port
      porcelain.replica_set = plumbing.replica_set
      porcelain.connect_to_replica = plumbing.connect_to_replica
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.mongo_legacy_replicaset_to_plumbing(porcelain)
      plumbing = V1::MongoLegacyReplicaset.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.auth_database = porcelain.auth_database unless porcelain.auth_database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.replica_set = porcelain.replica_set unless porcelain.replica_set == nil
      plumbing.connect_to_replica = porcelain.connect_to_replica unless porcelain.connect_to_replica == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_mongo_legacy_replicaset_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = mongo_legacy_replicaset_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_mongo_legacy_replicaset_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = mongo_legacy_replicaset_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.mongo_host_to_porcelain(plumbing)
      porcelain = MongoHost.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.auth_database = plumbing.auth_database
      porcelain.port_override = plumbing.port_override
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port = plumbing.port
      porcelain.schema = plumbing.schema
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.mongo_host_to_plumbing(porcelain)
      plumbing = V1::MongoHost.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.auth_database = porcelain.auth_database unless porcelain.auth_database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.schema = porcelain.schema unless porcelain.schema == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_mongo_host_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = mongo_host_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_mongo_host_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = mongo_host_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.mongo_replica_set_to_porcelain(plumbing)
      porcelain = MongoReplicaSet.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.hostname = plumbing.hostname
      porcelain.auth_database = plumbing.auth_database
      porcelain.port_override = plumbing.port_override
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.port = plumbing.port
      porcelain.replica_set = plumbing.replica_set
      porcelain.connect_to_replica = plumbing.connect_to_replica
      porcelain.tls_required = plumbing.tls_required
      porcelain
    end

    def self.mongo_replica_set_to_plumbing(porcelain)
      plumbing = V1::MongoReplicaSet.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.auth_database = porcelain.auth_database unless porcelain.auth_database == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.port = porcelain.port unless porcelain.port == nil
      plumbing.replica_set = porcelain.replica_set unless porcelain.replica_set == nil
      plumbing.connect_to_replica = porcelain.connect_to_replica unless porcelain.connect_to_replica == nil
      plumbing.tls_required = porcelain.tls_required unless porcelain.tls_required == nil
      plumbing
    end
    def self.repeated_mongo_replica_set_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = mongo_replica_set_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_mongo_replica_set_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = mongo_replica_set_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.athena_to_porcelain(plumbing)
      porcelain = Athena.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.healthy = plumbing.healthy
      porcelain.access_key = plumbing.access_key
      porcelain.secret_access_key = plumbing.secret_access_key
      porcelain.output = plumbing.output
      porcelain.port_override = plumbing.port_override
      porcelain.region = plumbing.region
      porcelain
    end

    def self.athena_to_plumbing(porcelain)
      plumbing = V1::Athena.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.access_key = porcelain.access_key unless porcelain.access_key == nil
      plumbing.secret_access_key = porcelain.secret_access_key unless porcelain.secret_access_key == nil
      plumbing.output = porcelain.output unless porcelain.output == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.region = porcelain.region unless porcelain.region == nil
      plumbing
    end
    def self.repeated_athena_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = athena_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_athena_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = athena_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.create_response_metadata_to_porcelain(plumbing)
      porcelain = CreateResponseMetadata.new()
      porcelain
    end

    def self.create_response_metadata_to_plumbing(porcelain)
      plumbing = V1::CreateResponseMetadata.new()
      plumbing
    end
    def self.repeated_create_response_metadata_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = create_response_metadata_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_create_response_metadata_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = create_response_metadata_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.get_response_metadata_to_porcelain(plumbing)
      porcelain = GetResponseMetadata.new()
      porcelain
    end

    def self.get_response_metadata_to_plumbing(porcelain)
      plumbing = V1::GetResponseMetadata.new()
      plumbing
    end
    def self.repeated_get_response_metadata_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = get_response_metadata_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_get_response_metadata_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = get_response_metadata_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.update_response_metadata_to_porcelain(plumbing)
      porcelain = UpdateResponseMetadata.new()
      porcelain
    end

    def self.update_response_metadata_to_plumbing(porcelain)
      plumbing = V1::UpdateResponseMetadata.new()
      plumbing
    end
    def self.repeated_update_response_metadata_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = update_response_metadata_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_update_response_metadata_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = update_response_metadata_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.delete_response_metadata_to_porcelain(plumbing)
      porcelain = DeleteResponseMetadata.new()
      porcelain
    end

    def self.delete_response_metadata_to_plumbing(porcelain)
      plumbing = V1::DeleteResponseMetadata.new()
      plumbing
    end
    def self.repeated_delete_response_metadata_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = delete_response_metadata_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_delete_response_metadata_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = delete_response_metadata_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.rate_limit_metadata_to_porcelain(plumbing)
      porcelain = RateLimitMetadata.new()
      porcelain.limit = plumbing.limit
      porcelain.remaining = plumbing.remaining
      porcelain.reset_at = timestamp_to_porcelain(plumbing.reset_at)
      porcelain.bucket = plumbing.bucket
      porcelain
    end

    def self.rate_limit_metadata_to_plumbing(porcelain)
      plumbing = V1::RateLimitMetadata.new()
      plumbing.limit = porcelain.limit unless porcelain.limit == nil
      plumbing.remaining = porcelain.remaining unless porcelain.remaining == nil
      plumbing.reset_at = timestamp_to_plumbing(porcelain.reset_at) unless porcelain.reset_at == nil
      plumbing.bucket = porcelain.bucket unless porcelain.bucket == nil
      plumbing
    end
    def self.repeated_rate_limit_metadata_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = rate_limit_metadata_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_rate_limit_metadata_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = rate_limit_metadata_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.node_create_response_to_porcelain(plumbing)
      porcelain = NodeCreateResponse.new()
      porcelain.meta = create_response_metadata_to_porcelain(plumbing.meta)
      porcelain.node = node_to_porcelain(plumbing.node)
      porcelain.token = plumbing.token
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.node_create_response_to_plumbing(porcelain)
      plumbing = V1::NodeCreateResponse.new()
      plumbing.meta = create_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.node = node_to_plumbing(porcelain.node) unless porcelain.node == nil
      plumbing.token = porcelain.token unless porcelain.token == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_node_create_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = node_create_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_node_create_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = node_create_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.node_get_response_to_porcelain(plumbing)
      porcelain = NodeGetResponse.new()
      porcelain.meta = get_response_metadata_to_porcelain(plumbing.meta)
      porcelain.node = node_to_porcelain(plumbing.node)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.node_get_response_to_plumbing(porcelain)
      plumbing = V1::NodeGetResponse.new()
      plumbing.meta = get_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.node = node_to_plumbing(porcelain.node) unless porcelain.node == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_node_get_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = node_get_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_node_get_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = node_get_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.node_update_response_to_porcelain(plumbing)
      porcelain = NodeUpdateResponse.new()
      porcelain.meta = update_response_metadata_to_porcelain(plumbing.meta)
      porcelain.node = node_to_porcelain(plumbing.node)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.node_update_response_to_plumbing(porcelain)
      plumbing = V1::NodeUpdateResponse.new()
      plumbing.meta = update_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.node = node_to_plumbing(porcelain.node) unless porcelain.node == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_node_update_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = node_update_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_node_update_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = node_update_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.node_delete_response_to_porcelain(plumbing)
      porcelain = NodeDeleteResponse.new()
      porcelain.meta = delete_response_metadata_to_porcelain(plumbing.meta)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.node_delete_response_to_plumbing(porcelain)
      plumbing = V1::NodeDeleteResponse.new()
      plumbing.meta = delete_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_node_delete_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = node_delete_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_node_delete_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = node_delete_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.node_to_plumbing(porcelain)
      plumbing = V1::Node.new()
      if porcelain.instance_of? Relay
        plumbing.relay = relay_to_plumbing(porcelain)
      end
      if porcelain.instance_of? Gateway
        plumbing.gateway = gateway_to_plumbing(porcelain)
      end
      plumbing
    end

    def self.node_to_porcelain(plumbing)
      if plumbing.relay != nil
        return relay_to_porcelain(plumbing.relay)
      end
      if plumbing.gateway != nil
        return gateway_to_porcelain(plumbing.gateway)
      end
    end
    def self.repeated_node_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = node_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_node_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = node_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.relay_to_porcelain(plumbing)
      porcelain = Relay.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.state = plumbing.state
      porcelain
    end

    def self.relay_to_plumbing(porcelain)
      plumbing = V1::Relay.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.state = porcelain.state unless porcelain.state == nil
      plumbing
    end
    def self.repeated_relay_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = relay_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_relay_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = relay_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.gateway_to_porcelain(plumbing)
      porcelain = Gateway.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.state = plumbing.state
      porcelain.listen_address = plumbing.listen_address
      porcelain.bind_address = plumbing.bind_address
      porcelain
    end

    def self.gateway_to_plumbing(porcelain)
      plumbing = V1::Gateway.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.state = porcelain.state unless porcelain.state == nil
      plumbing.listen_address = porcelain.listen_address unless porcelain.listen_address == nil
      plumbing.bind_address = porcelain.bind_address unless porcelain.bind_address == nil
      plumbing
    end
    def self.repeated_gateway_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = gateway_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_gateway_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = gateway_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.resource_create_response_to_porcelain(plumbing)
      porcelain = ResourceCreateResponse.new()
      porcelain.meta = create_response_metadata_to_porcelain(plumbing.meta)
      porcelain.resource = resource_to_porcelain(plumbing.resource)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.resource_create_response_to_plumbing(porcelain)
      plumbing = V1::ResourceCreateResponse.new()
      plumbing.meta = create_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.resource = resource_to_plumbing(porcelain.resource) unless porcelain.resource == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_resource_create_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = resource_create_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_resource_create_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = resource_create_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.resource_get_response_to_porcelain(plumbing)
      porcelain = ResourceGetResponse.new()
      porcelain.meta = get_response_metadata_to_porcelain(plumbing.meta)
      porcelain.resource = resource_to_porcelain(plumbing.resource)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.resource_get_response_to_plumbing(porcelain)
      plumbing = V1::ResourceGetResponse.new()
      plumbing.meta = get_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.resource = resource_to_plumbing(porcelain.resource) unless porcelain.resource == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_resource_get_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = resource_get_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_resource_get_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = resource_get_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.resource_update_response_to_porcelain(plumbing)
      porcelain = ResourceUpdateResponse.new()
      porcelain.meta = update_response_metadata_to_porcelain(plumbing.meta)
      porcelain.resource = resource_to_porcelain(plumbing.resource)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.resource_update_response_to_plumbing(porcelain)
      plumbing = V1::ResourceUpdateResponse.new()
      plumbing.meta = update_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.resource = resource_to_plumbing(porcelain.resource) unless porcelain.resource == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_resource_update_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = resource_update_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_resource_update_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = resource_update_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.resource_delete_response_to_porcelain(plumbing)
      porcelain = ResourceDeleteResponse.new()
      porcelain.meta = delete_response_metadata_to_porcelain(plumbing.meta)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.resource_delete_response_to_plumbing(porcelain)
      plumbing = V1::ResourceDeleteResponse.new()
      plumbing.meta = delete_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_resource_delete_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = resource_delete_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_resource_delete_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = resource_delete_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_attachment_create_response_to_porcelain(plumbing)
      porcelain = RoleAttachmentCreateResponse.new()
      porcelain.meta = create_response_metadata_to_porcelain(plumbing.meta)
      porcelain.role_attachment = role_attachment_to_porcelain(plumbing.role_attachment)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.role_attachment_create_response_to_plumbing(porcelain)
      plumbing = V1::RoleAttachmentCreateResponse.new()
      plumbing.meta = create_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.role_attachment = role_attachment_to_plumbing(porcelain.role_attachment) unless porcelain.role_attachment == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_role_attachment_create_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_attachment_create_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_attachment_create_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_attachment_create_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_attachment_get_response_to_porcelain(plumbing)
      porcelain = RoleAttachmentGetResponse.new()
      porcelain.meta = get_response_metadata_to_porcelain(plumbing.meta)
      porcelain.role_attachment = role_attachment_to_porcelain(plumbing.role_attachment)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.role_attachment_get_response_to_plumbing(porcelain)
      plumbing = V1::RoleAttachmentGetResponse.new()
      plumbing.meta = get_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.role_attachment = role_attachment_to_plumbing(porcelain.role_attachment) unless porcelain.role_attachment == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_role_attachment_get_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_attachment_get_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_attachment_get_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_attachment_get_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_attachment_delete_response_to_porcelain(plumbing)
      porcelain = RoleAttachmentDeleteResponse.new()
      porcelain.meta = delete_response_metadata_to_porcelain(plumbing.meta)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.role_attachment_delete_response_to_plumbing(porcelain)
      plumbing = V1::RoleAttachmentDeleteResponse.new()
      plumbing.meta = delete_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_role_attachment_delete_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_attachment_delete_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_attachment_delete_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_attachment_delete_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_attachment_to_porcelain(plumbing)
      porcelain = RoleAttachment.new()
      porcelain.id = plumbing.id
      porcelain.composite_role_id = plumbing.composite_role_id
      porcelain.attached_role_id = plumbing.attached_role_id
      porcelain
    end

    def self.role_attachment_to_plumbing(porcelain)
      plumbing = V1::RoleAttachment.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.composite_role_id = porcelain.composite_role_id unless porcelain.composite_role_id == nil
      plumbing.attached_role_id = porcelain.attached_role_id unless porcelain.attached_role_id == nil
      plumbing
    end
    def self.repeated_role_attachment_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_attachment_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_attachment_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_attachment_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_create_response_to_porcelain(plumbing)
      porcelain = RoleCreateResponse.new()
      porcelain.meta = create_response_metadata_to_porcelain(plumbing.meta)
      porcelain.role = role_to_porcelain(plumbing.role)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.role_create_response_to_plumbing(porcelain)
      plumbing = V1::RoleCreateResponse.new()
      plumbing.meta = create_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.role = role_to_plumbing(porcelain.role) unless porcelain.role == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_role_create_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_create_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_create_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_create_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_get_response_to_porcelain(plumbing)
      porcelain = RoleGetResponse.new()
      porcelain.meta = get_response_metadata_to_porcelain(plumbing.meta)
      porcelain.role = role_to_porcelain(plumbing.role)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.role_get_response_to_plumbing(porcelain)
      plumbing = V1::RoleGetResponse.new()
      plumbing.meta = get_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.role = role_to_plumbing(porcelain.role) unless porcelain.role == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_role_get_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_get_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_get_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_get_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_update_response_to_porcelain(plumbing)
      porcelain = RoleUpdateResponse.new()
      porcelain.meta = update_response_metadata_to_porcelain(plumbing.meta)
      porcelain.role = role_to_porcelain(plumbing.role)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.role_update_response_to_plumbing(porcelain)
      plumbing = V1::RoleUpdateResponse.new()
      plumbing.meta = update_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.role = role_to_plumbing(porcelain.role) unless porcelain.role == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_role_update_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_update_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_update_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_update_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_delete_response_to_porcelain(plumbing)
      porcelain = RoleDeleteResponse.new()
      porcelain.meta = delete_response_metadata_to_porcelain(plumbing.meta)
      porcelain.rate_limit = rate_limit_metadata_to_porcelain(plumbing.rate_limit)
      porcelain
    end

    def self.role_delete_response_to_plumbing(porcelain)
      plumbing = V1::RoleDeleteResponse.new()
      plumbing.meta = delete_response_metadata_to_plumbing(porcelain.meta) unless porcelain.meta == nil
      plumbing.rate_limit = rate_limit_metadata_to_plumbing(porcelain.rate_limit) unless porcelain.rate_limit == nil
      plumbing
    end
    def self.repeated_role_delete_response_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_delete_response_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_delete_response_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_delete_response_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.role_to_porcelain(plumbing)
      porcelain = Role.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.composite = plumbing.composite
      porcelain
    end

    def self.role_to_plumbing(porcelain)
      plumbing = V1::Role.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.composite = porcelain.composite unless porcelain.composite == nil
      plumbing
    end
    def self.repeated_role_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = role_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_role_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = role_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end
    def self.error_to_porcelain(err)
      if not err.is_a? GRPC::BadStatus
        return RPCError.new(err, 2) # Unknown
      end

      if err.code == 4
        return DeadlineExceededError.new(err.message)
      end

      status = err.to_rpc_status
      if status == nil
        return RPCError.new(err.message, err.code)
      end
      case err.code
      when 3
        return BadRequestError.new(err.message)
      when 5
        return NotFoundError.new(err.message)
      when 6
        return AlreadyExistsError.new(err.message)
      when 7
        return PermissionError.new(err.message)
      when 8
        status.details.each do |detail|
          if detail.type_url == "type.googleapis.com/v1.RateLimitMetadata"
            rate_limit = detail.unpack V1::RateLimitMetadata
            return RateLimitError.new(err.message, rate_limit_metadata_to_porcelain(rate_limit))
          end
        end
      when 13
        return InternalError.new(err.message)
      when 16
        return AuthenticationError.new(err.message)
      end
      return RPCError.new(err.message, err.code)
    end
  end
end
