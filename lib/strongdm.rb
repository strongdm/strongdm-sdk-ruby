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

# This file was generated by protogen. DO NOT EDIT.

require_relative "./svc"
require "base64"
require "openssl"

DEFAULT_MAX_RETRIES = 3
DEFAULT_BASE_RETRY_DELAY = 0.0030 # 30 ms
DEFAULT_MAX_RETRY_DELAY = 300 # 300 seconds
API_VERSION = "2021-08-23"
USER_AGENT = "strongdm-sdk-ruby/1.0.33"

module SDM

  # Client bundles all the services together and initializes them.
  class Client
    # Creates a new strongDM API client.
    def initialize(api_access_key, api_secret_key, host: "api.strongdm.com:443", insecure: false)
      raise TypeError, "client access key must be a string" unless api_access_key.kind_of?(String)
      raise TypeError, "client secret key must be a string" unless api_secret_key.kind_of?(String)
      raise TypeError, "client host must be a string" unless host.kind_of?(String)
      @api_access_key = api_access_key.strip
      @api_secret_key = Base64.strict_decode64(api_secret_key.strip)
      @max_retries = DEFAULT_MAX_RETRIES
      @base_retry_delay = DEFAULT_BASE_RETRY_DELAY
      @max_retry_delay = DEFAULT_MAX_RETRY_DELAY
      @account_attachments = AccountAttachments.new(host, insecure, self)
      @account_grants = AccountGrants.new(host, insecure, self)
      @accounts = Accounts.new(host, insecure, self)
      @control_panel = ControlPanel.new(host, insecure, self)
      @nodes = Nodes.new(host, insecure, self)
      @resources = Resources.new(host, insecure, self)
      @role_attachments = RoleAttachments.new(host, insecure, self)
      @role_grants = RoleGrants.new(host, insecure, self)
      @roles = Roles.new(host, insecure, self)
      @secret_stores = SecretStores.new(host, insecure, self)
      @_test_options = Hash.new
    end

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

    def jitterSleep(iter)
      dur_max = @base_retry_delay * 2 ** iter
      if (dur_max > @max_retry_delay)
        dur_max = @max_retry_delay
      end
      dur = rand() * dur_max
      sleep(dur)
    end

    def shouldRetry(iter, err)
      if (iter >= @max_retries - 1)
        return false
      end
      if not err.is_a? GRPC::BadStatus
        return true
      end
      return err.code() == 13
    end

    attr_reader :max_retries
    attr_reader :base_retry_delay
    attr_reader :max_retry_delay

    # API authentication token (read-only).
    attr_reader :api_access_key
    # AccountAttachments assign an account to a role or composite role.
    attr_reader :account_attachments
    # AccountGrants assign a resource directly to an account, giving the account the permission to connect to that resource.
    attr_reader :account_grants
    # Accounts are users that have access to strongDM. There are two types of accounts:
    # 1. **Users:** humans who are authenticated through username and password or SSO.
    # 2. **Service Accounts:** machines that are authenticated using a service token.
    attr_reader :accounts
    # ControlPanel contains all administrative controls.
    attr_reader :control_panel
    # Nodes make up the strongDM network, and allow your users to connect securely to your resources. There are two types of nodes:
    # - **Gateways** are the entry points into network. They listen for connection from the strongDM client, and provide access to databases and servers.
    # - **Relays** are used to extend the strongDM network into segmented subnets. They provide access to databases and servers but do not listen for incoming connections.
    attr_reader :nodes

    attr_reader :resources
    # RoleAttachments represent relationships between composite roles and the roles
    # that make up those composite roles. When a composite role is attached to another
    # role, the permissions granted to members of the composite role are augmented to
    # include the permissions granted to members of the attached role.
    attr_reader :role_attachments
    # RoleGrants represent relationships between composite roles and the roles
    # that make up those composite roles. When a composite role is attached to another
    # role, the permissions granted to members of the composite role are augmented to
    # include the permissions granted to members of the attached role.
    attr_reader :role_grants
    # Roles are tools for controlling user access to resources. Each Role holds a
    # list of resources which they grant access to. Composite roles are a special
    # type of Role which have no resource associations of their own, but instead
    # grant access to the combined resources associated with a set of child roles.
    # Each user can be a member of one Role or composite role.
    attr_reader :roles
    # SecretStores are servers where resource secrets (passwords, keys) are stored.
    attr_reader :secret_stores
    attr_reader :_test_options
  end
end
