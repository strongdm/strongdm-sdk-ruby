this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
$LOAD_PATH.unshift(this_dir) unless $LOAD_PATH.include?(this_dir)

require 'grpc'
require 'nodes_services_pb'
require 'nodes_porcelain'
require 'nodes_plumbing'

def test
    p "1"
    stub = V1::Nodes::Stub.new('localhost:8889', :this_channel_is_insecure)
    p "2"
    resp = stub.list(V1::NodeListRequest.new())
    meta = resp.meta
    nodes = resp.nodes
    p "3"
    p "meta: #{meta}"
    p "Nodes: #{nodes}"
end


def addRelay(relay)
    stub = V1::Nodes::Stub.new('localhost:8889', :this_channel_is_insecure)
    req = V1::NodeCreateRequest.new()
    req.nodes.push(Node_to_plumbing(relay))
    resp = stub.create(req)
end

def main
    r = Relay.new()
    r.name = "bananas"
    addRelay(r)
end
main