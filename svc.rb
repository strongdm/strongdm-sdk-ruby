this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'grpc')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require 'grpc'
require 'enumerator'
Dir[File.join(__dir__, 'grpc', '*.rb')].each {|file| require file }
Dir[File.join(__dir__, 'models', '*.rb')].each {|file| require file }

module SDM

    # Nodes are proxies in the strongDM network. They come in two flavors: relays,
    # which communicate with resources, and gateways, which communicate with
    # clients.
    class Nodes
        def initialize(url, parent)
            begin
                if url.end_with?("443")
                    cred = GRPC::Core::ChannelCredentials.new()
                    @stub = V1::Nodes::Stub.new(url, cred)
                else
                    @stub = V1::Nodes::Stub.new(url, :this_channel_is_insecure)
                end
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            @parent = parent
        end
        
            
        # Create registers a new Node.
        def create(node, deadline:nil)
            
            req = V1::NodeCreateRequest.new()
            req.node = Plumbing::node_to_plumbing(node)

            begin
                plumbing_response = @stub.create(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp.token = plumbing_response.token
            resp
            
        end
        
            
        # Get reads one Node by ID.
        def get(id, deadline:nil)
            
            req = V1::NodeGetRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.get(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeGetResponse.new()
            resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp
            
        end
        
            
        # Update patches a Node by ID.
        def update(node, deadline:nil)
            
            req = V1::NodeUpdateRequest.new()
            req.node = Plumbing::node_to_plumbing(node)

            begin
                plumbing_response = @stub.update(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeUpdateResponse.new()
            resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp
            
        end
        
            
        # Delete removes a Node by ID.
        def delete(id, deadline:nil)
            
            req = V1::NodeDeleteRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.delete(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp
            
        end
        
            
        # List gets a list of Nodes matching a given set of criteria.
        def list(filter, deadline:nil)
            
            req = V1::NodeListRequest.new()
            req.meta = V1::ListRequestMetadata.new()
            page_size_option = @parent._test_options['PageSize']
            if page_size_option.is_a? Integer
                req.meta.limit = page_size_option
            end
            req.filter = filter
            resp = Enumerator::Generator.new { |g|
                loop do
                    begin
                        plumbing_response = @stub.list(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
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
    # Roles are tools for controlling user access to resources. Each Role holds a
    # list of resources which they grant access to. Composite roles are a special
    # type of Role which have no resource associations of their own, but instead
    # grant access to the combined resources associated with a set of child roles.
    # Each user can be a member of one Role or composite role.
    class Roles
        def initialize(url, parent)
            begin
                if url.end_with?("443")
                    cred = GRPC::Core::ChannelCredentials.new()
                    @stub = V1::Roles::Stub.new(url, cred)
                else
                    @stub = V1::Roles::Stub.new(url, :this_channel_is_insecure)
                end
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            @parent = parent
        end
        
            
        # Create registers a new Role.
        def create(role, deadline:nil)
            
            req = V1::RoleCreateRequest.new()
            req.role = Plumbing::role_to_plumbing(role)

            begin
                plumbing_response = @stub.create(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp
            
        end
        
            
        # Get reads one Role by ID.
        def get(id, deadline:nil)
            
            req = V1::RoleGetRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.get(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleGetResponse.new()
            resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp
            
        end
        
            
        # Update patches a Role by ID.
        def update(role, deadline:nil)
            
            req = V1::RoleUpdateRequest.new()
            req.role = Plumbing::role_to_plumbing(role)

            begin
                plumbing_response = @stub.update(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleUpdateResponse.new()
            resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp
            
        end
        
            
        # Delete removes a Role by ID.
        def delete(id, deadline:nil)
            
            req = V1::RoleDeleteRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.delete(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp
            
        end
        
            
        # List gets a list of Roles matching a given set of criteria.
        def list(filter, deadline:nil)
            
            req = V1::RoleListRequest.new()
            req.meta = V1::ListRequestMetadata.new()
            page_size_option = @parent._test_options['PageSize']
            if page_size_option.is_a? Integer
                req.meta.limit = page_size_option
            end
            req.filter = filter
            resp = Enumerator::Generator.new { |g|
                loop do
                    begin
                        plumbing_response = @stub.list(req, metadata:{ 'authorization': @parent.api_key }, deadline:deadline)
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