# Copyright 2020 StrongDM Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# @internal This file was generated by protogen. DO NOT EDIT.

require_relative "./svc"
require "base64"
require "openssl"
require "time"

module SDM #:nodoc:

  # Client bundles all the services together and initializes them.
  class Client
    DEFAULT_MAX_RETRIES = 3
    DEFAULT_BASE_RETRY_DELAY = 0.0030 # 30 ms
    DEFAULT_MAX_RETRY_DELAY = 300 # 300 seconds
    API_VERSION = "2021-08-23"
    USER_AGENT = "strongdm-sdk-ruby/3.2.1"
    private_constant :DEFAULT_MAX_RETRIES, :DEFAULT_BASE_RETRY_DELAY, :DEFAULT_MAX_RETRY_DELAY, :API_VERSION, :USER_AGENT

    # Creates a new strongDM API client.
    def initialize(api_access_key, api_secret_key, host: "api.strongdm.com:443", insecure: false, retry_rate_limit_errors: true)
      raise TypeError, "client access key must be a string" unless api_access_key.kind_of?(String)
      raise TypeError, "client secret key must be a string" unless api_secret_key.kind_of?(String)
      raise TypeError, "client host must be a string" unless host.kind_of?(String)
      @api_access_key = api_access_key.strip
      @api_secret_key = Base64.strict_decode64(api_secret_key.strip)
      @max_retries = DEFAULT_MAX_RETRIES
      @base_retry_delay = DEFAULT_BASE_RETRY_DELAY
      @max_retry_delay = DEFAULT_MAX_RETRY_DELAY
      @expose_rate_limit_errors = (not retry_rate_limit_errors)
      @account_attachments = AccountAttachments.new(host, insecure, self)
      @account_grants = AccountGrants.new(host, insecure, self)
      @accounts = Accounts.new(host, insecure, self)
      @control_panel = ControlPanel.new(host, insecure, self)
      @nodes = Nodes.new(host, insecure, self)
      @remote_identities = RemoteIdentities.new(host, insecure, self)
      @remote_identity_groups = RemoteIdentityGroups.new(host, insecure, self)
      @resources = Resources.new(host, insecure, self)
      @roles = Roles.new(host, insecure, self)
      @secret_stores = SecretStores.new(host, insecure, self)
      @_test_options = Hash.new
    end

    # @private
    def get_metadata(method_name, req)
      return {
               'x-sdm-authentication': @api_access_key,
               'x-sdm-signature': self.sign(method_name, req.to_proto),
               'x-sdm-api-version': API_VERSION,
               'x-sdm-user-agent': USER_AGENT,
             }
    end

    def sign(method_name, msg_bytes)
      current_utc_date = Time.now.utc
      date = sprintf("%04d-%02d-%02d", current_utc_date.year, current_utc_date.month, current_utc_date.day)

      signing_key = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, @api_secret_key, date)
      signing_key = OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, signing_key, "sdm_api_v1")

      sha_req = Digest::SHA256.new
      sha_req << method_name
      sha_req << "\n"
      sha_req << msg_bytes
      request_hash = sha_req.digest

      return Base64.strict_encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::SHA256.new, signing_key, request_hash))
    end

    # @private
    def jitterSleep(iter)
      dur_max = @base_retry_delay * 2 ** iter
      if (dur_max > @max_retry_delay)
        dur_max = @max_retry_delay
      end
      dur = rand() * dur_max
      sleep(dur)
    end

    # @private
    def shouldRetry(iter, err)
      if (iter >= @max_retries - 1)
        return false
      end
      if not err.is_a? GRPC::BadStatus
        return true
      end
      porcelainErr = Plumbing::convert_error_to_porcelain(err)
      if (not @expose_rate_limit_errors) and (porcelainErr.is_a? RateLimitError)
        sleep_for = porcelainErr.rate_limit.reset_at - Time.now
        # If timezones or clock drift causes this calculation to fail,
        # wait at most one minute.
        if sleep_for < 0 or sleep_for > 60
          sleep_for = 60
        end
        sleep(sleep_for)
        return true
      end
      return err.code() == 13
    end

    attr_reader :max_retries
    attr_reader :base_retry_delay
    attr_reader :max_retry_delay

    # API authentication token (read-only).
    attr_reader :api_access_key
    # AccountAttachments assign an account to a role.
    #
    # See {AccountAttachments}.
    attr_reader :account_attachments
    # AccountGrants assign a resource directly to an account, giving the account the permission to connect to that resource.
    #
    # See {AccountGrants}.
    attr_reader :account_grants
    # Accounts are users that have access to strongDM. There are two types of accounts:
    # 1. **Users:** humans who are authenticated through username and password or SSO.
    # 2. **Service Accounts:** machines that are authenticated using a service token.
    #
    # See {Accounts}.
    attr_reader :accounts
    # ControlPanel contains all administrative controls.
    #
    # See {ControlPanel}.
    attr_reader :control_panel
    # Nodes make up the strongDM network, and allow your users to connect securely to your resources. There are two types of nodes:
    # - **Gateways** are the entry points into network. They listen for connection from the strongDM client, and provide access to databases and servers.
    # - **Relays** are used to extend the strongDM network into segmented subnets. They provide access to databases and servers but do not listen for incoming connections.
    #
    # See {Nodes}.
    attr_reader :nodes
    # RemoteIdentities assign a resource directly to an account, giving the account the permission to connect to that resource.
    #
    # See {RemoteIdentities}.
    attr_reader :remote_identities
    # A RemoteIdentityGroup is a named grouping of Remote Identities for Accounts.
    # An Account's relationship to a RemoteIdentityGroup is defined via RemoteIdentity objects.
    #
    # See {RemoteIdentityGroups}.
    attr_reader :remote_identity_groups
    # Resources are databases, servers, clusters, websites, or clouds that strongDM
    # delegates access to.
    #
    # See {Resources}.
    attr_reader :resources
    # A Role has a list of access rules which determine which Resources the members
    # of the Role have access to. An Account can be a member of multiple Roles via
    # AccountAttachments.
    #
    # See {Roles}.
    attr_reader :roles
    # SecretStores are servers where resource secrets (passwords, keys) are stored.
    #
    # See {SecretStores}.
    attr_reader :secret_stores
    # @private
    attr_reader :_test_options
  end
end
