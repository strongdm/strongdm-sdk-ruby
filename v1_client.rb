this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require 'grpc'
Dir[File.join(__dir__, 'grpc', '*.rb')].each {|file| require file }
Dir[File.join(__dir__, 'models', '*.rb')].each {|file| require file }

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
        
        def get(id)
            req = V1::NodeGetRequest.new()
            req.id = id

            plumbing_response = @stub.get(req)

            resp = NodeGetResponse.new()
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp
        end
        
        def update(id, node)
            req = V1::NodeUpdateRequest.new()
            req.id = id
            req.node = Plumbing::node_to_plumbing(node)

            plumbing_response = @stub.update(req)

            resp = NodeUpdateResponse.new()
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp
        end
        
        def delete(id)
            req = V1::NodeDeleteRequest.new()
            req.id = id

            plumbing_response = @stub.delete(req)

            resp = NodeDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp
        end
        
        def list(filter)
            req = V1::NodeListRequest.new()
            req.filter = filter

            plumbing_response = @stub.list(req)

            resp = NodeListResponse.new()
            resp.meta = Plumbing::list_response_metadata_to_porcelain(plumbing_response.meta)
            resp.nodes = Plumbing::repeated_node_to_porcelain(plumbing_response.nodes)
            resp
        end
        
        def batch_update(nodes)
            req = V1::NodeBatchUpdateRequest.new()
            req.nodes += Plumbing::repeated_node_to_plumbing(nodes)

            plumbing_response = @stub.batch_update(req)

            resp = NodeBatchUpdateResponse.new()
            resp
        end
        
        def batch_delete(ids)
            req = V1::NodeBatchDeleteRequest.new()
            req.ids += Plumbing::repeated_string_to_plumbing(ids)

            plumbing_response = @stub.batch_delete(req)

            resp = NodeBatchDeleteResponse.new()
            resp.meta = Plumbing::batch_delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp
        end
        
    end
end