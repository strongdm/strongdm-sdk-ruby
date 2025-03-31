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

# @internal Code generated by protogen. DO NOT EDIT.

require_relative "./svc"
require "base64"
require "grpc"
require "openssl"
require "time"

module SDM #:nodoc:

  # Client bundles all the services together and initializes them.
  class Client
    DEFAULT_MAX_RETRIES = 3
    DEFAULT_BASE_RETRY_DELAY = 0.0030 # 30 ms
    DEFAULT_MAX_RETRY_DELAY = 300 # 300 seconds
    API_VERSION = "2024-03-28"
    USER_AGENT = "strongdm-sdk-ruby/13.6.0"
    private_constant :DEFAULT_MAX_RETRIES, :DEFAULT_BASE_RETRY_DELAY, :DEFAULT_MAX_RETRY_DELAY, :API_VERSION, :USER_AGENT

    # Creates a new strongDM API client.
    def initialize(api_access_key, api_secret_key, host: "app.strongdm.com:443", insecure: false, retry_rate_limit_errors: true, page_limit: 50)
      raise TypeError, "client access key must be a string" unless api_access_key.kind_of?(String)
      raise TypeError, "client secret key must be a string" unless api_secret_key.kind_of?(String)
      raise TypeError, "client host must be a string" unless host.kind_of?(String)
      @api_access_key = api_access_key.strip
      @api_secret_key = Base64.strict_decode64(api_secret_key.strip)
      @max_retries = DEFAULT_MAX_RETRIES
      @base_retry_delay = DEFAULT_BASE_RETRY_DELAY
      @max_retry_delay = DEFAULT_MAX_RETRY_DELAY
      @page_limit = page_limit
      @expose_rate_limit_errors = (not retry_rate_limit_errors)
      @snapshot_time = nil
      begin
        if insecure
          @channel = GRPC::Core::Channel.new(host, {}, :this_channel_is_insecure)
        else
          cred = GRPC::Core::ChannelCredentials.new()
          @channel = GRPC::Core::Channel.new(host, {}, cred)
        end
      rescue => exception
        raise Plumbing::convert_error_to_porcelain(exception)
      end
      @access_requests = AccessRequests.new(@channel, self)
      @access_request_events_history = AccessRequestEventsHistory.new(@channel, self)
      @access_requests_history = AccessRequestsHistory.new(@channel, self)
      @account_attachments = AccountAttachments.new(@channel, self)
      @account_attachments_history = AccountAttachmentsHistory.new(@channel, self)
      @account_grants = AccountGrants.new(@channel, self)
      @account_grants_history = AccountGrantsHistory.new(@channel, self)
      @account_permissions = AccountPermissions.new(@channel, self)
      @account_resources = AccountResources.new(@channel, self)
      @account_resources_history = AccountResourcesHistory.new(@channel, self)
      @accounts = Accounts.new(@channel, self)
      @accounts_history = AccountsHistory.new(@channel, self)
      @activities = Activities.new(@channel, self)
      @approval_workflow_approvers = ApprovalWorkflowApprovers.new(@channel, self)
      @approval_workflow_approvers_history = ApprovalWorkflowApproversHistory.new(@channel, self)
      @approval_workflow_steps = ApprovalWorkflowSteps.new(@channel, self)
      @approval_workflow_steps_history = ApprovalWorkflowStepsHistory.new(@channel, self)
      @approval_workflows = ApprovalWorkflows.new(@channel, self)
      @approval_workflows_history = ApprovalWorkflowsHistory.new(@channel, self)
      @control_panel = ControlPanel.new(@channel, self)
      @health_checks = HealthChecks.new(@channel, self)
      @identity_aliases = IdentityAliases.new(@channel, self)
      @identity_aliases_history = IdentityAliasesHistory.new(@channel, self)
      @identity_sets = IdentitySets.new(@channel, self)
      @identity_sets_history = IdentitySetsHistory.new(@channel, self)
      @nodes = Nodes.new(@channel, self)
      @nodes_history = NodesHistory.new(@channel, self)
      @organization_history = OrganizationHistory.new(@channel, self)
      @peering_group_nodes = PeeringGroupNodes.new(@channel, self)
      @peering_group_peers = PeeringGroupPeers.new(@channel, self)
      @peering_group_resources = PeeringGroupResources.new(@channel, self)
      @peering_groups = PeeringGroups.new(@channel, self)
      @policies = Policies.new(@channel, self)
      @policies_history = PoliciesHistory.new(@channel, self)
      @proxy_cluster_keys = ProxyClusterKeys.new(@channel, self)
      @queries = Queries.new(@channel, self)
      @remote_identities = RemoteIdentities.new(@channel, self)
      @remote_identities_history = RemoteIdentitiesHistory.new(@channel, self)
      @remote_identity_groups = RemoteIdentityGroups.new(@channel, self)
      @remote_identity_groups_history = RemoteIdentityGroupsHistory.new(@channel, self)
      @replays = Replays.new(@channel, self)
      @resources = Resources.new(@channel, self)
      @resources_history = ResourcesHistory.new(@channel, self)
      @role_resources = RoleResources.new(@channel, self)
      @role_resources_history = RoleResourcesHistory.new(@channel, self)
      @roles = Roles.new(@channel, self)
      @roles_history = RolesHistory.new(@channel, self)
      @secret_stores = SecretStores.new(@channel, self)
      @secret_store_healths = SecretStoreHealths.new(@channel, self)
      @secret_stores_history = SecretStoresHistory.new(@channel, self)
      @workflow_approvers = WorkflowApprovers.new(@channel, self)
      @workflow_approvers_history = WorkflowApproversHistory.new(@channel, self)
      @workflow_assignments = WorkflowAssignments.new(@channel, self)
      @workflow_assignments_history = WorkflowAssignmentsHistory.new(@channel, self)
      @workflow_roles = WorkflowRoles.new(@channel, self)
      @workflow_roles_history = WorkflowRolesHistory.new(@channel, self)
      @workflows = Workflows.new(@channel, self)
      @workflows_history = WorkflowsHistory.new(@channel, self)
    end

    # Closes this client and releases all resources held by it.
    def close
      begin
        @channel.close()
      rescue => exception
        raise Plumbing::convert_error_to_porcelain(exception)
      end
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
      # The grpc library unfortunately does not raise a more specific error class.
      if err.is_a? RuntimeError and err.message == "closed!"
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
      return (err.code() == 13 or err.code() == 14)
    end

    # Constructs a read-only client that will provide historical data from the provided timestamp.
    # See {SnapshotClient}.
    def snapshot_at(snapshot_time)
      client = self.clone
      client.snapshot_time = snapshot_time
      return SnapshotClient.new(client)
    end

    attr_reader :max_retries
    attr_reader :base_retry_delay
    attr_reader :max_retry_delay
    attr_accessor :page_limit

    # API authentication token (read-only).
    attr_reader :api_access_key
    # Optional timestamp at which to provide historical data
    attr_reader :snapshot_time
    # AccessRequests are requests for access to a resource that may match a Workflow.
    #
    # See {AccessRequests}.
    attr_reader :access_requests
    # AccessRequestEventsHistory provides records of all changes to the state of an AccessRequest.
    #
    # See {AccessRequestEventsHistory}.
    attr_reader :access_request_events_history
    # AccessRequestsHistory provides records of all changes to the state of an AccessRequest.
    #
    # See {AccessRequestsHistory}.
    attr_reader :access_requests_history
    # AccountAttachments assign an account to a role.
    #
    # See {AccountAttachments}.
    attr_reader :account_attachments
    # AccountAttachmentsHistory records all changes to the state of an AccountAttachment.
    #
    # See {AccountAttachmentsHistory}.
    attr_reader :account_attachments_history
    # AccountGrants assign a resource directly to an account, giving the account the permission to connect to that resource.
    #
    # See {AccountGrants}.
    attr_reader :account_grants
    # AccountGrantsHistory records all changes to the state of an AccountGrant.
    #
    # See {AccountGrantsHistory}.
    attr_reader :account_grants_history
    # AccountPermissions records the granular permissions accounts have, allowing them to execute
    # relevant commands via StrongDM's APIs.
    #
    # See {AccountPermissions}.
    attr_reader :account_permissions
    # AccountResources enumerates the resources to which accounts have access.
    # The AccountResources service is read-only.
    #
    # See {AccountResources}.
    attr_reader :account_resources
    # AccountResourcesHistory records all changes to the state of a AccountResource.
    #
    # See {AccountResourcesHistory}.
    attr_reader :account_resources_history
    # Accounts are users that have access to strongDM. There are two types of accounts:
    # 1. **Users:** humans who are authenticated through username and password or SSO.
    # 2. **Service Accounts:** machines that are authenticated using a service token.
    # 3. **Tokens** are access keys with permissions that can be used for authentication.
    #
    # See {Accounts}.
    attr_reader :accounts
    # AccountsHistory records all changes to the state of an Account.
    #
    # See {AccountsHistory}.
    attr_reader :accounts_history
    # An Activity is a record of an action taken against a strongDM deployment, e.g.
    # a user creation, resource deletion, sso configuration change, etc. The Activities
    # service is read-only.
    #
    # See {Activities}.
    attr_reader :activities
    # ApprovalWorkflowApprovers link approval workflow approvers to an ApprovalWorkflowStep
    #
    # See {ApprovalWorkflowApprovers}.
    attr_reader :approval_workflow_approvers
    # ApprovalWorkflowApproversHistory records all changes to the state of an ApprovalWorkflowApprover.
    #
    # See {ApprovalWorkflowApproversHistory}.
    attr_reader :approval_workflow_approvers_history
    # ApprovalWorkflowSteps link approval workflow steps to an ApprovalWorkflow
    #
    # See {ApprovalWorkflowSteps}.
    attr_reader :approval_workflow_steps
    # ApprovalWorkflowStepsHistory records all changes to the state of an ApprovalWorkflowStep.
    #
    # See {ApprovalWorkflowStepsHistory}.
    attr_reader :approval_workflow_steps_history
    # ApprovalWorkflows are the mechanism by which requests for access can be viewed by authorized
    # approvers and be approved or denied.
    #
    # See {ApprovalWorkflows}.
    attr_reader :approval_workflows
    # ApprovalWorkflowsHistory records all changes to the state of an ApprovalWorkflow.
    #
    # See {ApprovalWorkflowsHistory}.
    attr_reader :approval_workflows_history
    # ControlPanel contains all administrative controls.
    #
    # See {ControlPanel}.
    attr_reader :control_panel
    # HealthChecks lists the last healthcheck between each node and resource.
    # Note the unconventional capitalization here is to prevent having a collision with GRPC
    #
    # See {HealthChecks}.
    attr_reader :health_checks
    # IdentityAliases assign an alias to an account within an IdentitySet.
    # The alias is used as the username when connecting to a identity supported resource.
    #
    # See {IdentityAliases}.
    attr_reader :identity_aliases
    # IdentityAliasesHistory records all changes to the state of a IdentityAlias.
    #
    # See {IdentityAliasesHistory}.
    attr_reader :identity_aliases_history
    # A IdentitySet is a named grouping of Identity Aliases for Accounts.
    # An Account's relationship to a IdentitySet is defined via IdentityAlias objects.
    #
    # See {IdentitySets}.
    attr_reader :identity_sets
    # IdentitySetsHistory records all changes to the state of a IdentitySet.
    #
    # See {IdentitySetsHistory}.
    attr_reader :identity_sets_history
    # Nodes make up the strongDM network, and allow your users to connect securely to your resources. There are two types of nodes:
    # - **Gateways** are the entry points into network. They listen for connection from the strongDM client, and provide access to databases and servers.
    # - **Relays** are used to extend the strongDM network into segmented subnets. They provide access to databases and servers but do not listen for incoming connections.
    #
    # See {Nodes}.
    attr_reader :nodes
    # NodesHistory records all changes to the state of a Node.
    #
    # See {NodesHistory}.
    attr_reader :nodes_history
    # OrganizationHistory records all changes to the state of an Organization.
    #
    # See {OrganizationHistory}.
    attr_reader :organization_history
    # PeeringGroupNodes provides the building blocks necessary to obtain attach a node to a peering group.
    #
    # See {PeeringGroupNodes}.
    attr_reader :peering_group_nodes
    # PeeringGroupPeers provides the building blocks necessary to link two peering groups.
    #
    # See {PeeringGroupPeers}.
    attr_reader :peering_group_peers
    # PeeringGroupResources provides the building blocks necessary to obtain attach a resource to a peering group.
    #
    # See {PeeringGroupResources}.
    attr_reader :peering_group_resources
    # PeeringGroups provides the building blocks necessary to obtain explicit network topology and routing.
    #
    # See {PeeringGroups}.
    attr_reader :peering_groups
    # Policies are the collection of one or more statements that enforce fine-grained access
    # control for the users of an organization.
    #
    # See {Policies}.
    attr_reader :policies
    # PoliciesHistory records all changes to the state of a Policy.
    #
    # See {PoliciesHistory}.
    attr_reader :policies_history
    # Proxy Cluster Keys are authentication keys for all proxies within a cluster.
    # The proxies within a cluster share the same key. One cluster can have
    # multiple keys in order to facilitate key rotation.
    #
    # See {ProxyClusterKeys}.
    attr_reader :proxy_cluster_keys
    # A Query is a record of a single client request to a resource, such as a SQL query.
    # Long-running SSH, RDP, or Kubernetes interactive sessions also count as queries.
    # The Queries service is read-only.
    #
    # See {Queries}.
    attr_reader :queries
    # RemoteIdentities assign a resource directly to an account, giving the account the permission to connect to that resource.
    #
    # See {RemoteIdentities}.
    attr_reader :remote_identities
    # RemoteIdentitiesHistory records all changes to the state of a RemoteIdentity.
    #
    # See {RemoteIdentitiesHistory}.
    attr_reader :remote_identities_history
    # A RemoteIdentityGroup is a named grouping of Remote Identities for Accounts.
    # An Account's relationship to a RemoteIdentityGroup is defined via RemoteIdentity objects.
    #
    # See {RemoteIdentityGroups}.
    attr_reader :remote_identity_groups
    # RemoteIdentityGroupsHistory records all changes to the state of a RemoteIdentityGroup.
    #
    # See {RemoteIdentityGroupsHistory}.
    attr_reader :remote_identity_groups_history
    # A Replay captures the data transferred over a long-running SSH, RDP, or Kubernetes interactive session
    # (otherwise referred to as a query). The Replays service is read-only.
    #
    # See {Replays}.
    attr_reader :replays
    # Resources are databases, servers, clusters, websites, or clouds that strongDM
    # delegates access to.
    #
    # See {Resources}.
    attr_reader :resources
    # ResourcesHistory records all changes to the state of a Resource.
    #
    # See {ResourcesHistory}.
    attr_reader :resources_history
    # RoleResources enumerates the resources to which roles have access.
    # The RoleResources service is read-only.
    #
    # See {RoleResources}.
    attr_reader :role_resources
    # RoleResourcesHistory records all changes to the state of a RoleResource.
    #
    # See {RoleResourcesHistory}.
    attr_reader :role_resources_history
    # A Role has a list of access rules which determine which Resources the members
    # of the Role have access to. An Account can be a member of multiple Roles via
    # AccountAttachments.
    #
    # See {Roles}.
    attr_reader :roles
    # RolesHistory records all changes to the state of a Role.
    #
    # See {RolesHistory}.
    attr_reader :roles_history
    # SecretStores are servers where resource secrets (passwords, keys) are stored.
    #
    # See {SecretStores}.
    attr_reader :secret_stores
    # SecretStoreHealths exposes health states for secret stores.
    #
    # See {SecretStoreHealths}.
    attr_reader :secret_store_healths
    # SecretStoresHistory records all changes to the state of a SecretStore.
    #
    # See {SecretStoresHistory}.
    attr_reader :secret_stores_history
    # WorkflowApprovers is an account or a role with the ability to approve requests bound to a workflow.
    #
    # See {WorkflowApprovers}.
    attr_reader :workflow_approvers
    # WorkflowApproversHistory provides records of all changes to the state of a WorkflowApprover.
    #
    # See {WorkflowApproversHistory}.
    attr_reader :workflow_approvers_history
    # WorkflowAssignments links a Resource to a Workflow. The assigned resources are those that a user can request
    # access to via the workflow.
    #
    # See {WorkflowAssignments}.
    attr_reader :workflow_assignments
    # WorkflowAssignmentsHistory provides records of all changes to the state of a WorkflowAssignment.
    #
    # See {WorkflowAssignmentsHistory}.
    attr_reader :workflow_assignments_history
    # WorkflowRole links a role to a workflow. The linked roles indicate which roles a user must be a part of
    # to request access to a resource via the workflow.
    #
    # See {WorkflowRoles}.
    attr_reader :workflow_roles
    # WorkflowRolesHistory provides records of all changes to the state of a WorkflowRole
    #
    # See {WorkflowRolesHistory}.
    attr_reader :workflow_roles_history
    # Workflows are the collection of rules that define the resources to which access can be requested,
    # the users that can request that access, and the mechanism for approving those requests which can either
    # be automatic approval or a set of users authorized to approve the requests.
    #
    # See {Workflows}.
    attr_reader :workflows
    # WorkflowsHistory provides records of all changes to the state of a Workflow.
    #
    # See {WorkflowsHistory}.
    attr_reader :workflows_history

    protected

    attr_writer :snapshot_time

    private

    def initialize_copy(other)
      @access_requests = AccessRequests.new(@channel, self)
      @access_request_events_history = AccessRequestEventsHistory.new(@channel, self)
      @access_requests_history = AccessRequestsHistory.new(@channel, self)
      @account_attachments = AccountAttachments.new(@channel, self)
      @account_attachments_history = AccountAttachmentsHistory.new(@channel, self)
      @account_grants = AccountGrants.new(@channel, self)
      @account_grants_history = AccountGrantsHistory.new(@channel, self)
      @account_permissions = AccountPermissions.new(@channel, self)
      @account_resources = AccountResources.new(@channel, self)
      @account_resources_history = AccountResourcesHistory.new(@channel, self)
      @accounts = Accounts.new(@channel, self)
      @accounts_history = AccountsHistory.new(@channel, self)
      @activities = Activities.new(@channel, self)
      @approval_workflow_approvers = ApprovalWorkflowApprovers.new(@channel, self)
      @approval_workflow_approvers_history = ApprovalWorkflowApproversHistory.new(@channel, self)
      @approval_workflow_steps = ApprovalWorkflowSteps.new(@channel, self)
      @approval_workflow_steps_history = ApprovalWorkflowStepsHistory.new(@channel, self)
      @approval_workflows = ApprovalWorkflows.new(@channel, self)
      @approval_workflows_history = ApprovalWorkflowsHistory.new(@channel, self)
      @control_panel = ControlPanel.new(@channel, self)
      @health_checks = HealthChecks.new(@channel, self)
      @identity_aliases = IdentityAliases.new(@channel, self)
      @identity_aliases_history = IdentityAliasesHistory.new(@channel, self)
      @identity_sets = IdentitySets.new(@channel, self)
      @identity_sets_history = IdentitySetsHistory.new(@channel, self)
      @nodes = Nodes.new(@channel, self)
      @nodes_history = NodesHistory.new(@channel, self)
      @organization_history = OrganizationHistory.new(@channel, self)
      @peering_group_nodes = PeeringGroupNodes.new(@channel, self)
      @peering_group_peers = PeeringGroupPeers.new(@channel, self)
      @peering_group_resources = PeeringGroupResources.new(@channel, self)
      @peering_groups = PeeringGroups.new(@channel, self)
      @policies = Policies.new(@channel, self)
      @policies_history = PoliciesHistory.new(@channel, self)
      @proxy_cluster_keys = ProxyClusterKeys.new(@channel, self)
      @queries = Queries.new(@channel, self)
      @remote_identities = RemoteIdentities.new(@channel, self)
      @remote_identities_history = RemoteIdentitiesHistory.new(@channel, self)
      @remote_identity_groups = RemoteIdentityGroups.new(@channel, self)
      @remote_identity_groups_history = RemoteIdentityGroupsHistory.new(@channel, self)
      @replays = Replays.new(@channel, self)
      @resources = Resources.new(@channel, self)
      @resources_history = ResourcesHistory.new(@channel, self)
      @role_resources = RoleResources.new(@channel, self)
      @role_resources_history = RoleResourcesHistory.new(@channel, self)
      @roles = Roles.new(@channel, self)
      @roles_history = RolesHistory.new(@channel, self)
      @secret_stores = SecretStores.new(@channel, self)
      @secret_store_healths = SecretStoreHealths.new(@channel, self)
      @secret_stores_history = SecretStoresHistory.new(@channel, self)
      @workflow_approvers = WorkflowApprovers.new(@channel, self)
      @workflow_approvers_history = WorkflowApproversHistory.new(@channel, self)
      @workflow_assignments = WorkflowAssignments.new(@channel, self)
      @workflow_assignments_history = WorkflowAssignmentsHistory.new(@channel, self)
      @workflow_roles = WorkflowRoles.new(@channel, self)
      @workflow_roles_history = WorkflowRolesHistory.new(@channel, self)
      @workflows = Workflows.new(@channel, self)
      @workflows_history = WorkflowsHistory.new(@channel, self)
    end
  end

  # SnapshotClient exposes methods to query historical records at a provided timestamp.
  class SnapshotClient
    def initialize(client)
      @access_requests = SnapshotAccessRequests.new(client.access_requests)
      @account_attachments = SnapshotAccountAttachments.new(client.account_attachments)
      @account_grants = SnapshotAccountGrants.new(client.account_grants)
      @account_permissions = SnapshotAccountPermissions.new(client.account_permissions)
      @account_resources = SnapshotAccountResources.new(client.account_resources)
      @accounts = SnapshotAccounts.new(client.accounts)
      @approval_workflow_approvers = SnapshotApprovalWorkflowApprovers.new(client.approval_workflow_approvers)
      @approval_workflow_steps = SnapshotApprovalWorkflowSteps.new(client.approval_workflow_steps)
      @approval_workflows = SnapshotApprovalWorkflows.new(client.approval_workflows)
      @identity_aliases = SnapshotIdentityAliases.new(client.identity_aliases)
      @identity_sets = SnapshotIdentitySets.new(client.identity_sets)
      @nodes = SnapshotNodes.new(client.nodes)
      @policies = SnapshotPolicies.new(client.policies)
      @proxy_cluster_keys = SnapshotProxyClusterKeys.new(client.proxy_cluster_keys)
      @remote_identities = SnapshotRemoteIdentities.new(client.remote_identities)
      @remote_identity_groups = SnapshotRemoteIdentityGroups.new(client.remote_identity_groups)
      @resources = SnapshotResources.new(client.resources)
      @role_resources = SnapshotRoleResources.new(client.role_resources)
      @roles = SnapshotRoles.new(client.roles)
      @secret_stores = SnapshotSecretStores.new(client.secret_stores)
      @workflow_approvers = SnapshotWorkflowApprovers.new(client.workflow_approvers)
      @workflow_assignments = SnapshotWorkflowAssignments.new(client.workflow_assignments)
      @workflow_roles = SnapshotWorkflowRoles.new(client.workflow_roles)
      @workflows = SnapshotWorkflows.new(client.workflows)
    end

    # AccessRequests are requests for access to a resource that may match a Workflow.
    #
    # See {SnapshotAccessRequests}.
    attr_reader :access_requests
    # AccountAttachments assign an account to a role.
    #
    # See {SnapshotAccountAttachments}.
    attr_reader :account_attachments
    # AccountGrants assign a resource directly to an account, giving the account the permission to connect to that resource.
    #
    # See {SnapshotAccountGrants}.
    attr_reader :account_grants
    # AccountPermissions records the granular permissions accounts have, allowing them to execute
    # relevant commands via StrongDM's APIs.
    #
    # See {SnapshotAccountPermissions}.
    attr_reader :account_permissions
    # AccountResources enumerates the resources to which accounts have access.
    # The AccountResources service is read-only.
    #
    # See {SnapshotAccountResources}.
    attr_reader :account_resources
    # Accounts are users that have access to strongDM. There are two types of accounts:
    # 1. **Users:** humans who are authenticated through username and password or SSO.
    # 2. **Service Accounts:** machines that are authenticated using a service token.
    # 3. **Tokens** are access keys with permissions that can be used for authentication.
    #
    # See {SnapshotAccounts}.
    attr_reader :accounts
    # ApprovalWorkflowApprovers link approval workflow approvers to an ApprovalWorkflowStep
    #
    # See {SnapshotApprovalWorkflowApprovers}.
    attr_reader :approval_workflow_approvers
    # ApprovalWorkflowSteps link approval workflow steps to an ApprovalWorkflow
    #
    # See {SnapshotApprovalWorkflowSteps}.
    attr_reader :approval_workflow_steps
    # ApprovalWorkflows are the mechanism by which requests for access can be viewed by authorized
    # approvers and be approved or denied.
    #
    # See {SnapshotApprovalWorkflows}.
    attr_reader :approval_workflows
    # IdentityAliases assign an alias to an account within an IdentitySet.
    # The alias is used as the username when connecting to a identity supported resource.
    #
    # See {SnapshotIdentityAliases}.
    attr_reader :identity_aliases
    # A IdentitySet is a named grouping of Identity Aliases for Accounts.
    # An Account's relationship to a IdentitySet is defined via IdentityAlias objects.
    #
    # See {SnapshotIdentitySets}.
    attr_reader :identity_sets
    # Nodes make up the strongDM network, and allow your users to connect securely to your resources. There are two types of nodes:
    # - **Gateways** are the entry points into network. They listen for connection from the strongDM client, and provide access to databases and servers.
    # - **Relays** are used to extend the strongDM network into segmented subnets. They provide access to databases and servers but do not listen for incoming connections.
    #
    # See {SnapshotNodes}.
    attr_reader :nodes
    # Policies are the collection of one or more statements that enforce fine-grained access
    # control for the users of an organization.
    #
    # See {SnapshotPolicies}.
    attr_reader :policies
    # Proxy Cluster Keys are authentication keys for all proxies within a cluster.
    # The proxies within a cluster share the same key. One cluster can have
    # multiple keys in order to facilitate key rotation.
    #
    # See {SnapshotProxyClusterKeys}.
    attr_reader :proxy_cluster_keys
    # RemoteIdentities assign a resource directly to an account, giving the account the permission to connect to that resource.
    #
    # See {SnapshotRemoteIdentities}.
    attr_reader :remote_identities
    # A RemoteIdentityGroup is a named grouping of Remote Identities for Accounts.
    # An Account's relationship to a RemoteIdentityGroup is defined via RemoteIdentity objects.
    #
    # See {SnapshotRemoteIdentityGroups}.
    attr_reader :remote_identity_groups
    # Resources are databases, servers, clusters, websites, or clouds that strongDM
    # delegates access to.
    #
    # See {SnapshotResources}.
    attr_reader :resources
    # RoleResources enumerates the resources to which roles have access.
    # The RoleResources service is read-only.
    #
    # See {SnapshotRoleResources}.
    attr_reader :role_resources
    # A Role has a list of access rules which determine which Resources the members
    # of the Role have access to. An Account can be a member of multiple Roles via
    # AccountAttachments.
    #
    # See {SnapshotRoles}.
    attr_reader :roles
    # SecretStores are servers where resource secrets (passwords, keys) are stored.
    #
    # See {SnapshotSecretStores}.
    attr_reader :secret_stores
    # WorkflowApprovers is an account or a role with the ability to approve requests bound to a workflow.
    #
    # See {SnapshotWorkflowApprovers}.
    attr_reader :workflow_approvers
    # WorkflowAssignments links a Resource to a Workflow. The assigned resources are those that a user can request
    # access to via the workflow.
    #
    # See {SnapshotWorkflowAssignments}.
    attr_reader :workflow_assignments
    # WorkflowRole links a role to a workflow. The linked roles indicate which roles a user must be a part of
    # to request access to a resource via the workflow.
    #
    # See {SnapshotWorkflowRoles}.
    attr_reader :workflow_roles
    # Workflows are the collection of rules that define the resources to which access can be requested,
    # the users that can request that access, and the mechanism for approving those requests which can either
    # be automatic approval or a set of users authorized to approve the requests.
    #
    # See {SnapshotWorkflows}.
    attr_reader :workflows
  end
end
