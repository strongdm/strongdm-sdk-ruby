require "grpc"
require "google/protobuf/well_known_types"
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
    def self.timestamp_to_porcelain(t)
      return Time.at(t.seconds + t.nanos * (10 ** -9))
    end

    def self.timestamp_to_plumbing(t)
      return Google::Protobuf::Timestamp.new(seconds: t.to_i, nanos: t.nsec)
    end

    def self.driver_to_plumbing(porcelain)
      plumbing = V1::Driver.new()
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
      if porcelain.instance_of? Athena
        plumbing.athena = athena_to_plumbing(porcelain)
      end
      plumbing
    end

    def self.driver_to_porcelain(plumbing)
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
      if plumbing.athena != nil
        return athena_to_porcelain(plumbing.athena)
      end
    end

    def self.repeated_driver_to_plumbing(porcelains)
      items = Array.new
      porcelains.each do |porcelain|
        plumbing = driver_to_plumbing(porcelain)
        items.append(plumbing)
      end
      items
    end

    def self.repeated_driver_to_porcelain(plumbings)
      items = Array.new
      plumbings.each do |plumbing|
        porcelain = driver_to_porcelain(plumbing)
        items.append(porcelain)
      end
      items
    end

    def self.mysql_to_porcelain(plumbing)
      porcelain = Mysql.new()
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port = plumbing.port
      porcelain
    end

    def self.mysql_to_plumbing(porcelain)
      plumbing = V1::Mysql.new()
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
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
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port = plumbing.port
      porcelain
    end

    def self.aurora_mysql_to_plumbing(porcelain)
      plumbing = V1::AuroraMysql.new()
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
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
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port = plumbing.port
      porcelain
    end

    def self.clustrix_to_plumbing(porcelain)
      plumbing = V1::Clustrix.new()
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
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
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port = plumbing.port
      porcelain
    end

    def self.maria_to_plumbing(porcelain)
      plumbing = V1::Maria.new()
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
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
      porcelain.hostname = plumbing.hostname
      porcelain.username = plumbing.username
      porcelain.password = plumbing.password
      porcelain.database = plumbing.database
      porcelain.port = plumbing.port
      porcelain
    end

    def self.memsql_to_plumbing(porcelain)
      plumbing = V1::Memsql.new()
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.username = porcelain.username unless porcelain.username == nil
      plumbing.password = porcelain.password unless porcelain.password == nil
      plumbing.database = porcelain.database unless porcelain.database == nil
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

    def self.athena_to_porcelain(plumbing)
      porcelain = Athena.new()
      porcelain.hostname = plumbing.hostname
      porcelain.access_key = plumbing.access_key
      porcelain.secretAccessKey = plumbing.secretAccessKey
      porcelain.region = plumbing.region
      porcelain.output = plumbing.output
      porcelain
    end

    def self.athena_to_plumbing(porcelain)
      plumbing = V1::Athena.new()
      plumbing.hostname = porcelain.hostname unless porcelain.hostname == nil
      plumbing.access_key = porcelain.access_key unless porcelain.access_key == nil
      plumbing.secretAccessKey = porcelain.secretAccessKey unless porcelain.secretAccessKey == nil
      plumbing.region = porcelain.region unless porcelain.region == nil
      plumbing.output = porcelain.output unless porcelain.output == nil
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

    def self.resource_to_porcelain(plumbing)
      porcelain = Resource.new()
      porcelain.id = plumbing.id
      porcelain.name = plumbing.name
      porcelain.port_override = plumbing.port_override
      porcelain.healthy = plumbing.healthy
      porcelain.driver = driver_to_porcelain(plumbing.driver)
      porcelain
    end

    def self.resource_to_plumbing(porcelain)
      plumbing = V1::Resource.new()
      plumbing.id = porcelain.id unless porcelain.id == nil
      plumbing.name = porcelain.name unless porcelain.name == nil
      plumbing.port_override = porcelain.port_override unless porcelain.port_override == nil
      plumbing.healthy = porcelain.healthy unless porcelain.healthy == nil
      plumbing.driver = driver_to_plumbing(porcelain.driver) unless porcelain.driver == nil
      plumbing
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
