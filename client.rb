this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require 'grpc'
require 'enumerator'
Dir[File.join(__dir__, 'grpc', '*.rb')].each {|file| require file }
Dir[File.join(__dir__, 'models', '*.rb')].each {|file| require file }

module SDM

    # Client bundles all the services together and initializes them.
    class Client
        def initialize(url)
            @nodes = Nodes.new(url)
        end
        attr_reader :nodes
    end

    # Nodes are proxies in strongDM responsible to communicate with servers
    # (relays) and clients (gateways).
    class Nodes
        def initialize(url)
            begin
                @stub = V1::Nodes::Stub.new(url, :this_channel_is_insecure)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
        end
        
        # Create registers a new node.
        def create(nodes)
            
                
            req = V1::NodeCreateRequest.new()
            req.nodes += Plumbing::repeated_node_to_plumbing(nodes)

            begin
                plumbing_response = @stub.create(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.nodes = Plumbing::repeated_node_to_porcelain(plumbing_response.nodes)
            resp.tokens = Plumbing::repeated_token_to_porcelain(plumbing_response.tokens)
            resp
            
        end
        
        # Get reads one node by ID.
        def get(id)
            
                
            req = V1::NodeGetRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.get(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeGetResponse.new()
            resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp
            
        end
        
        # Update patches a node by ID.
        def update(id, node)
            
                
            req = V1::NodeUpdateRequest.new()
            req.id = id
            req.node = Plumbing::node_to_plumbing(node)

            begin
                plumbing_response = @stub.update(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeUpdateResponse.new()
            resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp
            
        end
        
        # Delete removes a node by ID.
        def delete(id)
            
                
            req = V1::NodeDeleteRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.delete(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp
            
        end
        
        # List is a batched Get call.
        def list(filter)
            
                
            req = V1::NodeListRequest.new()
            req.meta = V1::ListRequestMetadata.new()
            req.filter = filter

            resp = NodeListResponse.new()
            resp.nodes = Enumerator::Generator.new { |g|
                loop do
                    begin
                        plumbing_response = @stub.list(req)
                    rescue => exception
                        raise Plumbing::error_to_porcelain(exception)
                    end
                    plumbing_response.nodes.each do |plumbing_item|
                        g.yield Plumbing::node_to_porcelain(plumbing_item)
                    end
                    break if plumbing_response.meta.next_page == ""
                    req.meta.page = plumbing_response.meta.next_page
                end
            }
            resp
            
        end
        
        # BatchUpdate is a batched Update call.
        def batch_update(nodes)
            
                
            req = V1::NodeBatchUpdateRequest.new()
            req.nodes += Plumbing::repeated_node_to_plumbing(nodes)

            begin
                plumbing_response = @stub.batch_update(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeBatchUpdateResponse.new()
            resp.meta = Plumbing::batch_update_response_metadata_to_porcelain(plumbing_response.meta)
            resp.nodes = Plumbing::repeated_node_to_porcelain(plumbing_response.nodes)
            resp
            
        end
        
        # BatchDelete is a batched Delete call.
        def batch_delete(ids)
            
                
            req = V1::NodeBatchDeleteRequest.new()
            req.ids += ids

            begin
                plumbing_response = @stub.batch_delete(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeBatchDeleteResponse.new()
            resp.meta = Plumbing::batch_delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp
            
        end
        
    end
end