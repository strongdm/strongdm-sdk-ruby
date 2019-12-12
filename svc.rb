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
                plumbing_response = @stub.create(req, metadata: @parent.get_metadata('Nodes.Create', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp.token = plumbing_response.token
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Get reads one Node by ID.
        def get(id, deadline:nil)
            
            req = V1::NodeGetRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.get(req, metadata: @parent.get_metadata('Nodes.Get', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeGetResponse.new()
            resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Update patches a Node by ID.
        def update(node, deadline:nil)
            
            req = V1::NodeUpdateRequest.new()
            req.node = Plumbing::node_to_plumbing(node)

            begin
                plumbing_response = @stub.update(req, metadata: @parent.get_metadata('Nodes.Update', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeUpdateResponse.new()
            resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
            resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Delete removes a Node by ID.
        def delete(id, deadline:nil)
            
            req = V1::NodeDeleteRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.delete(req, metadata: @parent.get_metadata('Nodes.Delete', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = NodeDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
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
                        plumbing_response = @stub.list(req, metadata: @parent.get_metadata('Nodes.List', req), deadline:deadline)
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


    class RoleAttachments
        def initialize(url, parent)
            begin
                if url.end_with?("443")
                    cred = GRPC::Core::ChannelCredentials.new()
                    @stub = V1::RoleAttachments::Stub.new(url, cred)
                else
                    @stub = V1::RoleAttachments::Stub.new(url, :this_channel_is_insecure)
                end
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            @parent = parent
        end
        
            
        # Create registers a new RoleAttachment.
        def create(role_attachment, deadline:nil)
            
            req = V1::RoleAttachmentCreateRequest.new()
            req.role_attachment = Plumbing::role_attachment_to_plumbing(role_attachment)

            begin
                plumbing_response = @stub.create(req, metadata: @parent.get_metadata('RoleAttachments.Create', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleAttachmentCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role_attachment = Plumbing::role_attachment_to_porcelain(plumbing_response.role_attachment)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Get reads one RoleAttachment by ID.
        def get(id, deadline:nil)
            
            req = V1::RoleAttachmentGetRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.get(req, metadata: @parent.get_metadata('RoleAttachments.Get', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleAttachmentGetResponse.new()
            resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role_attachment = Plumbing::role_attachment_to_porcelain(plumbing_response.role_attachment)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Delete removes an RoleAttachment by ID.
        def delete(id, deadline:nil)
            
            req = V1::RoleAttachmentDeleteRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.delete(req, metadata: @parent.get_metadata('RoleAttachments.Delete', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleAttachmentDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # List gets a list of RoleAttachments matching a given set of criteria.
        def list(filter, composite_role_id, deadline:nil)
            
            req = V1::RoleAttachmentListRequest.new()
            req.meta = V1::ListRequestMetadata.new()
            page_size_option = @parent._test_options['PageSize']
            if page_size_option.is_a? Integer
                req.meta.limit = page_size_option
            end
            req.filter = filter
            req.composite_role_id = composite_role_id
            resp = Enumerator::Generator.new { |g|
                loop do
                    begin
                        plumbing_response = @stub.list(req, metadata: @parent.get_metadata('RoleAttachments.List', req), deadline:deadline)
                    rescue => exception
                        raise Plumbing::error_to_porcelain(exception)
                    end
                    plumbing_response.role_attachments.each do |plumbing_item|
                        g.yield Plumbing::role_attachment_to_porcelain(plumbing_item)
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
                plumbing_response = @stub.create(req, metadata: @parent.get_metadata('Roles.Create', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleCreateResponse.new()
            resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Get reads one Role by ID.
        def get(id, deadline:nil)
            
            req = V1::RoleGetRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.get(req, metadata: @parent.get_metadata('Roles.Get', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleGetResponse.new()
            resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Update patches a Role by ID.
        def update(role, deadline:nil)
            
            req = V1::RoleUpdateRequest.new()
            req.role = Plumbing::role_to_plumbing(role)

            begin
                plumbing_response = @stub.update(req, metadata: @parent.get_metadata('Roles.Update', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleUpdateResponse.new()
            resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
            resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
            resp
            
        end
        
            
        # Delete removes a Role by ID.
        def delete(id, deadline:nil)
            
            req = V1::RoleDeleteRequest.new()
            req.id = id

            begin
                plumbing_response = @stub.delete(req, metadata: @parent.get_metadata('Roles.Delete', req), deadline:deadline)
            rescue => exception
                raise Plumbing::error_to_porcelain(exception)
            end
            resp = RoleDeleteResponse.new()
            resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
            resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
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
                        plumbing_response = @stub.list(req, metadata: @parent.get_metadata('Roles.List', req), deadline:deadline)
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