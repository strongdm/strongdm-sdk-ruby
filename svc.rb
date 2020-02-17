
this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, "grpc")
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
require "grpc"
require "enumerator"
Dir[File.join(__dir__, "grpc", "*.rb")].each { |file| require file }
Dir[File.join(__dir__, "models", "*.rb")].each { |file| require file }

module SDM
  # AccountAttachments represent relationships between an account and a role.
  class AccountAttachments
    def initialize(url, parent)
      begin
        if url.end_with?("443")
          cred = GRPC::Core::ChannelCredentials.new()
          @stub = V1::AccountAttachments::Stub.new(url, cred)
        else
          @stub = V1::AccountAttachments::Stub.new(url, :this_channel_is_insecure)
        end
      rescue => exception
        raise Plumbing::error_to_porcelain(exception)
      end
      @parent = parent
    end

    # Create registers a new AccountAttachment.
    def create(
               account_attachment,
               options: nil,
               deadline: nil)
      req = V1::AccountAttachmentCreateRequest.new()

      req.account_attachment = Plumbing::account_attachment_to_plumbing(account_attachment)
      req.options = Plumbing::account_attachment_create_options_to_plumbing(options)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("AccountAttachments.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountAttachmentCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.account_attachment = Plumbing::account_attachment_to_porcelain(plumbing_response.account_attachment)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one AccountAttachment by ID.
    def get(
            id,
            deadline: nil)
      req = V1::AccountAttachmentGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("AccountAttachments.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountAttachmentGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.account_attachment = Plumbing::account_attachment_to_porcelain(plumbing_response.account_attachment)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a AccountAttachment by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::AccountAttachmentDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("AccountAttachments.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountAttachmentDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of AccountAttachments matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::AccountAttachmentListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("AccountAttachments.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
          plumbing_response.account_attachments.each do |plumbing_item|
            g.yield Plumbing::account_attachment_to_porcelain(plumbing_item)
          end
          break if plumbing_response.meta.next_cursor == ""
          req.meta.cursor = plumbing_response.meta.next_cursor
        end
      }
      resp
    end
  end

  # AccountGrants represent relationships between composite roles and the roles
  # that make up those composite roles. When a composite role is attached to another
  # role, the permissions granted to members of the composite role are augmented to
  # include the permissions granted to members of the attached role.
  class AccountGrants
    def initialize(url, parent)
      begin
        if url.end_with?("443")
          cred = GRPC::Core::ChannelCredentials.new()
          @stub = V1::AccountGrants::Stub.new(url, cred)
        else
          @stub = V1::AccountGrants::Stub.new(url, :this_channel_is_insecure)
        end
      rescue => exception
        raise Plumbing::error_to_porcelain(exception)
      end
      @parent = parent
    end

    # Create registers a new AccountGrant.
    def create(
               account_grant,
               deadline: nil)
      req = V1::AccountGrantCreateRequest.new()

      req.account_grant = Plumbing::account_grant_to_plumbing(account_grant)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("AccountGrants.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountGrantCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.account_grant = Plumbing::account_grant_to_porcelain(plumbing_response.account_grant)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one AccountGrant by ID.
    def get(
            id,
            deadline: nil)
      req = V1::AccountGrantGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("AccountGrants.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountGrantGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.account_grant = Plumbing::account_grant_to_porcelain(plumbing_response.account_grant)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a AccountGrant by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::AccountGrantDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("AccountGrants.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountGrantDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of AccountGrants matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::AccountGrantListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("AccountGrants.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
          plumbing_response.account_grants.each do |plumbing_item|
            g.yield Plumbing::account_grant_to_porcelain(plumbing_item)
          end
          break if plumbing_response.meta.next_cursor == ""
          req.meta.cursor = plumbing_response.meta.next_cursor
        end
      }
      resp
    end
  end

  # Accounts are users, services or tokens who connect to and act within the strongDM network.
  class Accounts
    def initialize(url, parent)
      begin
        if url.end_with?("443")
          cred = GRPC::Core::ChannelCredentials.new()
          @stub = V1::Accounts::Stub.new(url, cred)
        else
          @stub = V1::Accounts::Stub.new(url, :this_channel_is_insecure)
        end
      rescue => exception
        raise Plumbing::error_to_porcelain(exception)
      end
      @parent = parent
    end

    # Create registers a new Account.
    def create(
               account,
               deadline: nil)
      req = V1::AccountCreateRequest.new()

      req.account = Plumbing::account_to_plumbing(account)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("Accounts.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.account = Plumbing::account_to_porcelain(plumbing_response.account)
      resp.token = plumbing_response.token
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one Account by ID.
    def get(
            id,
            deadline: nil)
      req = V1::AccountGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("Accounts.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.account = Plumbing::account_to_porcelain(plumbing_response.account)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Update patches a Account by ID.
    def update(
               account,
               deadline: nil)
      req = V1::AccountUpdateRequest.new()

      req.account = Plumbing::account_to_plumbing(account)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.update(req, metadata: @parent.get_metadata("Accounts.Update", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountUpdateResponse.new()
      resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
      resp.account = Plumbing::account_to_porcelain(plumbing_response.account)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a Account by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::AccountDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("Accounts.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = AccountDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of Accounts matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::AccountListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("Accounts.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
          plumbing_response.accounts.each do |plumbing_item|
            g.yield Plumbing::account_to_porcelain(plumbing_item)
          end
          break if plumbing_response.meta.next_cursor == ""
          req.meta.cursor = plumbing_response.meta.next_cursor
        end
      }
      resp
    end
  end

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
    def create(
               node,
               deadline: nil)
      req = V1::NodeCreateRequest.new()

      req.node = Plumbing::node_to_plumbing(node)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("Nodes.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = NodeCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
      resp.token = plumbing_response.token
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one Node by ID.
    def get(
            id,
            deadline: nil)
      req = V1::NodeGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("Nodes.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = NodeGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Update patches a Node by ID.
    def update(
               node,
               deadline: nil)
      req = V1::NodeUpdateRequest.new()

      req.node = Plumbing::node_to_plumbing(node)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.update(req, metadata: @parent.get_metadata("Nodes.Update", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = NodeUpdateResponse.new()
      resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
      resp.node = Plumbing::node_to_porcelain(plumbing_response.node)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a Node by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::NodeDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("Nodes.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = NodeDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of Nodes matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::NodeListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("Nodes.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
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

  class Resources
    def initialize(url, parent)
      begin
        if url.end_with?("443")
          cred = GRPC::Core::ChannelCredentials.new()
          @stub = V1::Resources::Stub.new(url, cred)
        else
          @stub = V1::Resources::Stub.new(url, :this_channel_is_insecure)
        end
      rescue => exception
        raise Plumbing::error_to_porcelain(exception)
      end
      @parent = parent
    end

    # Create registers a new Resource.
    def create(
               resource,
               deadline: nil)
      req = V1::ResourceCreateRequest.new()

      req.resource = Plumbing::resource_to_plumbing(resource)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("Resources.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = ResourceCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.resource = Plumbing::resource_to_porcelain(plumbing_response.resource)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one Resource by ID.
    def get(
            id,
            deadline: nil)
      req = V1::ResourceGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("Resources.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = ResourceGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.resource = Plumbing::resource_to_porcelain(plumbing_response.resource)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Update patches a Resource by ID.
    def update(
               resource,
               deadline: nil)
      req = V1::ResourceUpdateRequest.new()

      req.resource = Plumbing::resource_to_plumbing(resource)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.update(req, metadata: @parent.get_metadata("Resources.Update", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = ResourceUpdateResponse.new()
      resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
      resp.resource = Plumbing::resource_to_porcelain(plumbing_response.resource)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a Resource by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::ResourceDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("Resources.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = ResourceDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of Resources matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::ResourceListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("Resources.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
          plumbing_response.resources.each do |plumbing_item|
            g.yield Plumbing::resource_to_porcelain(plumbing_item)
          end
          break if plumbing_response.meta.next_cursor == ""
          req.meta.cursor = plumbing_response.meta.next_cursor
        end
      }
      resp
    end
  end

  # RoleAttachments represent relationships between composite roles and the roles
  # that make up those composite roles. When a composite role is attached to another
  # role, the permissions granted to members of the composite role are augmented to
  # include the permissions granted to members of the attached role.
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
    def create(
               role_attachment,
               deadline: nil)
      req = V1::RoleAttachmentCreateRequest.new()

      req.role_attachment = Plumbing::role_attachment_to_plumbing(role_attachment)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("RoleAttachments.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleAttachmentCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.role_attachment = Plumbing::role_attachment_to_porcelain(plumbing_response.role_attachment)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one RoleAttachment by ID.
    def get(
            id,
            deadline: nil)
      req = V1::RoleAttachmentGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("RoleAttachments.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleAttachmentGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.role_attachment = Plumbing::role_attachment_to_porcelain(plumbing_response.role_attachment)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a RoleAttachment by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::RoleAttachmentDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("RoleAttachments.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleAttachmentDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of RoleAttachments matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::RoleAttachmentListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("RoleAttachments.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
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

  # RoleGrants represent relationships between composite roles and the roles
  # that make up those composite roles. When a composite role is attached to another
  # role, the permissions granted to members of the composite role are augmented to
  # include the permissions granted to members of the attached role.
  class RoleGrants
    def initialize(url, parent)
      begin
        if url.end_with?("443")
          cred = GRPC::Core::ChannelCredentials.new()
          @stub = V1::RoleGrants::Stub.new(url, cred)
        else
          @stub = V1::RoleGrants::Stub.new(url, :this_channel_is_insecure)
        end
      rescue => exception
        raise Plumbing::error_to_porcelain(exception)
      end
      @parent = parent
    end

    # Create registers a new RoleGrant.
    def create(
               role_grant,
               deadline: nil)
      req = V1::RoleGrantCreateRequest.new()

      req.role_grant = Plumbing::role_grant_to_plumbing(role_grant)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("RoleGrants.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleGrantCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.role_grant = Plumbing::role_grant_to_porcelain(plumbing_response.role_grant)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one RoleGrant by ID.
    def get(
            id,
            deadline: nil)
      req = V1::RoleGrantGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("RoleGrants.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleGrantGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.role_grant = Plumbing::role_grant_to_porcelain(plumbing_response.role_grant)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a RoleGrant by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::RoleGrantDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("RoleGrants.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleGrantDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of RoleGrants matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::RoleGrantListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("RoleGrants.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
          plumbing_response.role_grants.each do |plumbing_item|
            g.yield Plumbing::role_grant_to_porcelain(plumbing_item)
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
    def create(
               role,
               deadline: nil)
      req = V1::RoleCreateRequest.new()

      req.role = Plumbing::role_to_plumbing(role)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.create(req, metadata: @parent.get_metadata("Roles.Create", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleCreateResponse.new()
      resp.meta = Plumbing::create_response_metadata_to_porcelain(plumbing_response.meta)
      resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Get reads one Role by ID.
    def get(
            id,
            deadline: nil)
      req = V1::RoleGetRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.get(req, metadata: @parent.get_metadata("Roles.Get", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleGetResponse.new()
      resp.meta = Plumbing::get_response_metadata_to_porcelain(plumbing_response.meta)
      resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Update patches a Role by ID.
    def update(
               role,
               deadline: nil)
      req = V1::RoleUpdateRequest.new()

      req.role = Plumbing::role_to_plumbing(role)
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.update(req, metadata: @parent.get_metadata("Roles.Update", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleUpdateResponse.new()
      resp.meta = Plumbing::update_response_metadata_to_porcelain(plumbing_response.meta)
      resp.role = Plumbing::role_to_porcelain(plumbing_response.role)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # Delete removes a Role by ID.
    def delete(
               id,
               deadline: nil)
      req = V1::RoleDeleteRequest.new()

      req.id = id
      tries = 0
      plumbing_response = nil
      loop do
        begin
          plumbing_response = @stub.delete(req, metadata: @parent.get_metadata("Roles.Delete", req), deadline: deadline)
        rescue => exception
          if (@parent.shouldRetry(tries, exception))
            tries + +@parent.jitterSleep(tries)
            continue
          end
          raise Plumbing::error_to_porcelain(exception)
        end
        break
      end

      resp = RoleDeleteResponse.new()
      resp.meta = Plumbing::delete_response_metadata_to_porcelain(plumbing_response.meta)
      resp.rate_limit = Plumbing::rate_limit_metadata_to_porcelain(plumbing_response.rate_limit)
      resp
    end

    # List gets a list of Roles matching a given set of criteria.
    def list(
             filter,
             *args,
             deadline: nil)
      req = V1::RoleListRequest.new()
      req.meta = V1::ListRequestMetadata.new()
      page_size_option = @parent._test_options["PageSize"]
      if page_size_option.is_a? Integer
        req.meta.limit = page_size_option
      end

      req.filter = Plumbing::quote_filter_args(filter, *args)
      resp = Enumerator::Generator.new { |g|
        tries = 0
        loop do
          begin
            plumbing_response = @stub.list(req, metadata: @parent.get_metadata("Roles.List", req), deadline: deadline)
          rescue => exception
            if (@parent.shouldRetry(tries, exception))
              tries + +@parent.jitterSleep(tries)
              continue
            end
            raise Plumbing::error_to_porcelain(exception)
          end
          tries = 0
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
