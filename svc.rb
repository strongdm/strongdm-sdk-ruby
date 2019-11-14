this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require 'grpc'
require 'enumerator'
Dir[File.join(__dir__, 'grpc', '*.rb')].each {|file| require file }
Dir[File.join(__dir__, 'models', '*.rb')].each {|file| require file }

module SDM

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
        def create(node)
            
            req = V1::NodeCreateRequest.new()
            req.node = Plumbing::node_to_plumbing(node)

            begin
                plumbing_response = @stub.create(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp.token = Plumbing::token_to_porcelain(plumbing_response.token)
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
            req.meta.limit = 25
            req.filter = filter
            resp = Enumerator::Generator.new { |g|
                loop do
                    begin
                        plumbing_response = @stub.list(req)
                    rescue => exception
                        raise Plumbing::error_to_porcelain(exception)
                    end
                    plumbing_response.nodes.each do |plumbing_item|
                        g.yield Plumbing::node_to_porcelain(plumbing_item)
                    end
                    break if plumbing_response.meta.next_cursor == ""
                    req.meta.cursor = plumbing_response.meta.next_cursor
                end
            }
            resp
            
        end
        
    end
    # Roles are
    class Roles
        def initialize(url)
            begin
                @stub = V1::Roles::Stub.new(url, :this_channel_is_insecure)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
        end
        
            
        # Create registers a new role.
        def create(role)
            
            req = V1::RoleCreateRequest.new()
            req.role = Plumbing::role_to_plumbing(role)

            begin
                plumbing_response = @stub.create(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp
            
        end
        
            
        # Get reads one role by ID.
        def get(id)
            
            req = V1::RoleGetRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.get(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleGetResponse.new()
            resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp
            
        end
        
            
        # Update patches a Role by ID.
        def update(id, role)
            
            req = V1::RoleUpdateRequest.new()
            req.id = id
            req.role = Plumbing::role_to_plumbing(role)

            begin
                plumbing_response = @stub.update(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleUpdateResponse.new()
            resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp
            
        end
        
            
        # Delete removes a Role by ID.
        def delete(id)
            
            req = V1::RoleDeleteRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.delete(req)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp
            
        end
        
            
        # List is a batched Get call.
        def list(filter)
            
            req = V1::RoleListRequest.new()
            req.meta = V1::ListRequestMetadata.new()
            req.meta.limit = 25
            req.filter = filter
            resp = Enumerator::Generator.new { |g|
                loop do
                    begin
                        plumbing_response = @stub.list(req)
                    rescue => exception
                        raise Plumbing::error_to_porcelain(exception)
                    end
                    plumbing_response.roles.each do |plumbing_item|
                        g.yield Plumbing::role_to_porcelain(plumbing_item)
                    end
                    break if plumbing_response.meta.next_cursor == ""
                    req.meta.cursor = plumbing_response.meta.next_cursor
                end
            }
            resp
            
        end
        
    end
end