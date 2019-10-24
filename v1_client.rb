this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require 'grpc'
require_relative './grpc/v1_plumbing'
require_relative './models/v1_porcelain'
require_relative './grpc/nodes_pb'
require_relative './grpc/nodes_services_pb'

module SDM
    # Nodes are proxies in strongDM responsible to communicate with servers
    # (relays) and clients (gateways).

    class Nodes
        def initialize(url)
            @stub = V1::Nodes::Stub.new(url, :this_channel_is_insecure)
        end
        
        def create(nodes)
            req = V1::NodeCreateRequest.new()
            req.nodes += Plumbing::repeated_node_to_plumbing(nodes)

            plumbing_response = @stub.create(req)

            resp = NodeCreateResponse.new()
            resp.nodes = Plumbing::repeated_node_to_porcelain(plumbing_response.nodes)
            resp.tokens = Plumbing::repeated_token_to_porcelain(plumbing_response.tokens)
            resp
        end
        
        def get()
            req = V1::NodeGetRequest.new()

            plumbing_response = @stub.get(req)

            resp = NodeGetResponse.new()
            resp
        end
        
        def update()
            req = V1::NodeUpdateRequest.new()

            plumbing_response = @stub.update(req)

            resp = NodeUpdateResponse.new()
            resp
        end
        
        def delete()
            req = V1::NodeDeleteRequest.new()

            plumbing_response = @stub.delete(req)

            resp = NodeDeleteResponse.new()
            resp
        end
        
        def list()
            req = V1::NodeListRequest.new()

            plumbing_response = @stub.list(req)

            resp = NodeListResponse.new()
            resp
        end
        
        def batch_update()
            req = V1::NodeBatchUpdateRequest.new()

            plumbing_response = @stub.batch_update(req)

            resp = NodeBatchUpdateResponse.new()
            resp
        end
        
        def batch_delete()
            req = V1::NodeBatchDeleteRequest.new()

            plumbing_response = @stub.batch_delete(req)

            resp = NodeBatchDeleteResponse.new()
            resp
        end
        
    end
end
