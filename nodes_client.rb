this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
  
require_relative './grpc/nodes_pb'
require_relative './grpc/nodes_services_pb'
require_relative './grpc/nodes_plumbing'
require_relative './models/nodes_porcelain'

def addRelay(relay)
    stub = V1::Nodes::Stub.new('localhost:8889', :this_channel_is_insecure)
    req = V1::NodeCreateRequest.new()
    req.nodes.push(Node_to_plumbing(relay))
    resp = stub.create(req)
end
