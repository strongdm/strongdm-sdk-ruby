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
# @internal Code generated by constgen. DO NOT EDIT.

module SDM

  # Permission Levels, shared by all entities capable of making authenticated requests against StrongDM.
  module PermissionLevel
    ROOT_ADMIN = "root-admin"
    ADMIN = "admin"
    DATABASE_ADMIN = "database-admin"
    TEAM_LEADER = "multi-team-leader"
    USER = "user"
    RELAY = "relay"
    ADMIN_TOKEN = "admin-token"
    SCIM_TOKEN = "scim-token"
    SERVICE = "service"
    SUSPENDED = "suspended"
    EMPTY = ""
  end

  # Node Lifecycle States, defining whether a node was last reported online, offline, restarting, etc.
  module NodeState
    NEW = "new"
    VERIFYING_RESTART = "verifying_restart"
    AWAITING_RESTART = "awaiting_restart"
    RESTARTING = "restarting"
    STARTED = "started"
    STOPPED = "stopped"
    DEAD = "dead"
  end

  # Providers responsible for managing roles and users.
  # None, or an empty string, implies the user is managed by strongDM.
  # Deprecated: Please use SCIMProvider instead.
  module Provider
    NONE = ""
    OKTA = "okta"
    SAIL_POINT = "sailpoint"
    AZURE = "azure"
    GENERIC = "generic"
    ONE_LOGIN = "onelogin"
    GOOGLE = "google"
  end

  # Providers responsible for managing roles and users.
  # None, or an empty string, implies the user is managed by strongDM.
  module SCIMProvider
    NONE = ""
    OKTA = "okta"
    SAIL_POINT = "sailpoint"
    AZURE = "azure"
    GENERIC = "generic"
    ONE_LOGIN = "onelogin"
    GOOGLE = "google"
  end

  # Providers responsible for SSO authentication.
  module AuthProvider
    AZURE = "azure"
    BITIUM = "bitium"
    GOOGLE = "google"
    OKTA = "okta"
    STRONG_DM = "strongdm"
    ACTIVE_DIRECTORY = "active directory"
    GENERIC_OIDC = "generic oidc"
    ONE_LOGIN_OIDC = "oneloginv2"
    KEYCLOAK = "keycloak"
    SHIBBOLETH = "shibboleth"
    AUTH_0 = "auth0"
    WORKSPACE_ONE = "workspace one"
    ONE_LOGIN_SAML = "onelogin-saml"
    GENERIC_SAML = "generic-saml"
    PING_IDSAML = "ping-identity-saml"
  end

  # Providers responsible for multi-factor authentication
  module MFAProvider
    NONE = ""
    DUO = "duo"
    TOTP = "totp"
  end

  # Activity Entities, all entity types that can be part of an activity.
  module ActivityEntityType
    USER = "user"
    ROLE = "role"
    LEGACY_COMPOSITE_ROLE = "composite_role"
    DATASOURCE = "datasource"
    ORGANIZATION = "organization"
    INSTALLATION = "installation"
    SECRET_STORE = "secretstore"
    REMOTE_IDENTITY_GROUP = "remote_identity_group"
    REMOTE_IDENTITY = "remote_identity"
    ACCESS_REQUEST = "access_request"
    WORKFLOW = "workflow"
    NODE = "node"
  end

  # Activity Verbs, describe which kind of activity has taken place.
  module ActivityVerb
    USER_ADDED = "user added"
    USER_DELETED = "user deleted"
    USER_UPDATED = "user updated"
    USER_SIGNUP = "user signup"
    USER_TYPE_CHANGED = "user type changed"
    USER_TEMPORARY_ACCESS_GRANTED = "user temporary access granted"
    USER_TEMPORARY_ACCESS_REVOKED = "user temporary access revoked"
    USER_TEMPORARY_ACCESS_EXPIRED = "user temporary access expired"
    USER_ADDED_TO_ROLE = "user added to role"
    USER_DELETED_FROM_ROLE = "user deleted from role"
    USER_SUSPENDED = "user suspended"
    USER_REINSTATED = "user reinstated"
    USER_LOGGED_INTO_THE_UI = "user logged into the Admin UI"
    PARENT_ADMIN_LOGGED_INTO_CHILD_ORG = "parent admin logged into the child org"
    USER_LOGGED_INTO_THE_CLIENT = "user logged into the local client"
    SERVICE_ACCOUNT_CREATED = "service account created"
    SERVICE_ACCOUNT_EXPIRED = "service account expired"
    ADMIN_TOKEN_ADDED = "admin token created"
    ADMIN_TOKEN_DELETED = "admin token deleted"
    ADMIN_TOKEN_EXPIRED = "admin token expired"
    ADMIN_TOKEN_REKEYED = "admin token rekeyed"
    ADMIN_TOKEN_CLONED = "admin token cloned"
    ADMIN_TOKEN_SUSPENDED = "admin token suspended"
    ADMIN_TOKEN_REINSTATED = "admin token reinstated"
    SSO_USER_LOGGED_INTO_THE_UI = "user logged into the Admin UI using SSO"
    SSO_USER_LOGGED_INTO_THE_CLIENT = "user logged into the local client using SSO"
    USER_LOGGED_OUT_FROM_THE_CLIENT = "user logged out from the local client"
    USER_LOGGED_OUT_FROM_THE_UI = "user logged out from the Admin UI"
    FAILED_LOGIN_FROM_THE_UI = "failed login attempt from the Admin UI"
    FAILED_LOGIN_FROM_THE_CLIENT = "failed login attempt from the local client"
    MFA_DENIED_FROM_THE_UI = "MFA denied access for the Admin UI"
    MFA_DENIED_FROM_THE_CLIENT = "MFA denied access for the local client"
    TOO_MANY_ATTEMPTS_LOCKOUT = "user account locked due to failed login attempts"
    ATTEMPT_COUNTER_RESET = "failed login attempt counter reset"
    SUSPENDED_USER_LOGIN_ATTEMPT_FROM_THE_CLIENT = "attempt to login by a suspended user from the local client"
    SUSPENDED_USER_LOGIN_ATTEMPT_FROM_THE_UI = "attempt to login by a suspended user from the Admin UI"
    SERVICE_ACCOUNT_LOGIN_ATTEMPT_FROM_THE_UI = "attempted to login by a service account from the Admin UI"
    SUSPENDED_SERVICE_ACCOUNT_LOGIN_ATTEMPT_FROM_THE_UI = "attempted to login by a suspended service account from the Admin UI"
    SUSPENDED_SERVICE_ACCOUNT_LOGIN_ATTEMPT_FROM_THE_CLIENT = "attempt to login by a suspended service account from the local client"
    USER_SET_A_PASSWORD = "user set a password"
    USER_RESET_A_PASSWORD = "user reset their password"
    USER_CHANGED_PASSWORD = "user changed their password"
    USER_INVITED = "user invited"
    USER_CLICKED_INVITATION = "user clicked on their invitation"
    USER_CLICKED_PASSWORD_RESET = "user clicked on their password reset"
    USER_ALLOW_PASSWORD_LOGIN = "user allowed to login via password"
    USER_REQUIRE_SSO_LOGIN = "user required to login via SSO"
    USER_PROVISIONING_ENABLED = "user provisioning enabled"
    USER_PROVISIONING_DISABLED = "user provisioning disabled"
    ADMIN_INITIATED_PASSWORD_RESET = "admin initiated password reset"
    ROLE_ADDED = "role added"
    ROLE_DELETED = "role deleted"
    ROLE_UPDATED = "role updated"
    ROLE_ACCESS_RULES_UPDATED = "access rules updated"
    ROLE_ACCESS_RULES_CREATED = "access rules created"
    ROLE_ACCESS_RULES_DELETED = "access rules deleted"
    ROLE_PROVISIONING_ENABLED = "role provisioning enabled"
    ROLE_PROVISIONING_DISABLED = "role provisioning disabled"
    DATASOURCE_ADDED = "datasource added"
    DATASOURCE_CLONED = "datasource cloned"
    DATASOURCE_DELETED = "datasource deleted"
    DATASOURCE_UPDATED = "datasource updated"
    DATASOURCE_PORT_OVERRIDE = "datasource connection port overriden"
    MULTIPLE_DATASOURCE_PORT_OVERRIDE = "multiple datasource ports overriden"
    SERVER_ADDED = "server added"
    SERVER_CLONED = "server cloned"
    SERVER_DELETED = "server deleted"
    SERVER_UPDATED = "server updated"
    SERVER_PORT_OVERRIDE = "server connection port overriden"
    MULTIPLE_SERVER_PORT_OVERRIDE = "multiple server ports overriden"
    CLUSTER_ADDED = "cluster added"
    CLUSTER_CLONED = "cluster cloned"
    CLUSTER_DELETED = "cluster deleted"
    CLUSTER_UPDATED = "cluster updated"
    CLUSTER_PORT_OVERRIDE = "cluster connection port overriden"
    MULTIPLE_CLUSTER_PORT_OVERRIDE = "multiple cluster ports overriden"
    CLOUD_ADDED = "cloud added"
    CLOUD_CLONED = "cloud cloned"
    CLOUD_DELETED = "cloud deleted"
    CLOUD_UPDATED = "cloud updated"
    WEBSITE_ADDED = "website added"
    WEBSITE_CLONED = "website cloned"
    WEBSITE_DELETED = "website deleted"
    WEBSITE_UPDATED = "website updated"
    INSTALLATION_CREATED = "installation created"
    RELAY_INSTALLATION_CREATED = "installation created for relay"
    INSTALLATION_APPROVED = "installation approved"
    INSTALLATION_REVOKED = "installation revoked"
    RELAY_CREATED = "relay created"
    RELAY_UPDATED_NAME = "relay name updated"
    RELAY_DELETED = "relay deleted"
    ORG_PUBLIC_KEY_UPDATED = "public key updated"
    ORG_ENFORCE_PORT_OVERRIDES_UPDATED = "port override enforcement updated"
    ORG_SERVICE_AUTO_CONNECT_UPDATED = "service account auto-connect updated"
    ORG_SELF_REGISTRATION_ACTIVATED = "self-registration activated"
    ORG_SELF_REGISTRATION_DEACTIVATED = "self-registration deactivated"
    ORG_NAME_UPDATED = "organization name updated"
    ORG_SETTING_UPDATED = "organization setting updated"
    ORG_LOG_SYNC_SETTING_UPDATED = "organization log sync setting updated"
    ORG_CREATED = "organization created"
    ORG_SCIM_PROVISIONING_UPDATED = "SCIM provider set"
    ORG_SCIM_PROVISIONING_DELETED = "SCIM provider deleted"
    ORG_CUSTOM_PROVISIONING_UPDATED = "Provisioning provider set"
    ORG_CUSTOM_PROVISIONING_DELETED = "Provisioning provider deleted"
    CHILD_ORG_ADMIN_INVITED = "child organization admin invited"
    SERVICE_ACCOUNT_REKEYED = "service account rekeyed"
    SCIM_TOKEN_ADDED = "SCIM token created"
    SCIM_TOKEN_DELETED = "SCIM token deleted"
    SCIM_TOKEN_REKEYED = "SCIM token rekeyed"
    API_KEY_DELETED = "API key deleted"
    ORG_SSH_CERTIFICATE_AUTHORITY_ROTATED = "organization SSH certificate authority rotated"
    ORG_SSH_ALLOW_PORT_FORWARDING = "allowed SSH port forwarding"
    ORG_SSH_DISALLOW_PORT_FORWARDING = "disallowed SSH port forwarding"
    ORG_ADD_CHILD = "add child organization"
    ORG_REMOVE_CHILD = "remove child organization"
    ORG_EXTEND_TRIAL = "trial extended"
    SECRET_STORE_ADDED = "secret store added"
    SECRET_STORE_UPDATED = "secret store updated"
    SECRET_STORE_DELETED = "secret store deleted"
    REMOTE_IDENTITY_GROUP_CREATED = "remote identity group created"
    REMOTE_IDENTITY_GROUP_UPDATED = "remote identity group updated"
    REMOTE_IDENTITY_GROUP_DELETED = "remote identity group deleted"
    REMOTE_IDENTITY_CREATED = "remote identity created"
    REMOTE_IDENTITY_UPDATED = "remote identity updated"
    REMOTE_IDENTITY_DELETED = "remote identity deleted"
    ACCESS_REQUESTED_TO_RESOURCE = "access requested to resource"
    ACCESS_REQUEST_TO_RESOURCE_APPROVED = "access request to resource approved"
    ACCESS_REQUEST_TO_RESOURCE_CANCELED = "access request to resource canceled"
    ACCESS_REQUEST_TO_RESOURCE_DENIED = "access request to resource denied"
    ACCESS_REQUEST_TO_RESOURCE_TIMED_OUT = "access request to resource timed out"
    WORKFLOW_ADDED = "access workflow added"
    WORKFLOW_DELETED = "access workflow deleted"
    WORKFLOW_RESOURCE_ASSIGNED = "resource assigned to workflow"
    WORKFLOW_RESOURCE_UNASSIGNED = "resource unassigned from workflow"
    WORKFLOW_RESOURCE_MULTIPLE_ASSIGNED = "multiple resources assigned to workflow"
    WORKFLOW_RESOURCE_MULTIPLE_UNASSIGNED = "multiple resources unassigned from workflow"
    WORKFLOW_ROLES_UPDATED = "workflow roles updated"
    WORKFLOW_NOTIFICATION_OPTION_ADDED = "workflow notification type added"
    WORKFLOW_NOTIFICATION_OPTION_REMOVED = "workflow notification type removed"
    WORKFLOW_NOTIFICATION_OPTIONS_UPDATED = "workflow notification settings updated"
    WORKFLOW_NAME_UPDATED = "workflow name updated"
    WORKFLOW_DESCRIPTION_UPDATED = "workflow description updated"
    ORG_VNM_SUBNET_UPDATED = "organization VNM subnet updated"
    ORG_VNM_RESOURCES_ALLOCATED = "organization resources allocated within VNM subnet"
    DEPRECATED_ORG_ACTIVATE_DEVICE_APPROVAL = "activate device approval"
    DEPRECATED_ORG_DEACTIVATE_DEVICE_APPROVAL = "deactivate device approval"
    EMULATION_MIGRATION_COMPLETED = "emulation migration completed"
    ACCESS_OVERHAUL_MIGRATION_COMPLETED = "access overhaul migration completed"
    ACTIVATED_SSH_PORT_FORWARDING_ALL_SERVER = "enabled SSH port forwarding on all servers"
  end

  # Permissions, all permissions that may be granted to an account.
  module Permission
    RELAY_LIST = "relay:list"
    RELAY_CREATE = "relay:create"
    DATASOURCE_LIST = "datasource:list"
    DATASOURCE_CREATE = "datasource:create"
    DATASOURCE_HEALTHCHECK = "datasource:healthcheck"
    DEPRECATED_DATASOURCE_GRANT = "datasource:grant"
    DATASOURCE_DELETE = "datasource:delete"
    DATASOURCE_UPDATE = "datasource:update"
    SECRET_STORE_CREATE = "secretstore:create"
    SECRET_STORE_LIST = "secretstore:list"
    SECRET_STORE_DELETE = "secretstore:delete"
    SECRET_STORE_UPDATE = "secretstore:update"
    SECRET_STORE_STATUS = "secretstore:status"
    REMOTE_IDENTITY_GROUP_WRITE = "remoteidentitygroup:write"
    REMOTE_IDENTITY_GROUP_READ = "remoteidentitygroup:read"
    REMOTE_IDENTITY_WRITE = "remoteidentity:write"
    REMOTE_IDENTITY_READ = "remoteidentity:read"
    USER_CREATE = "user:create"
    USER_LIST = "user:list"
    USER_UPDATE_ADMIN = "user:update_admin"
    USER_CREATE_ADMIN_TOKEN = "user:create_admin_token"
    USER_CREATE_SERVICE_ACCOUNT = "user:create_service_account"
    USER_SET_PERMISSION_LEVEL = "user:set_strong_role"
    USER_UPDATE = "user:update"
    USER_INITIATE_PASSWORD_RESET = "user:initiate_password_reset"
    USER_DELETE = "user:delete"
    USER_ASSIGN = "user:assign"
    USER_SUSPEND = "user:suspend"
    DEMO_PROVISIONING_REQUEST_CREATE = "demoprovisioningrequest:create"
    DEMO_PROVISIONING_REQUEST_LIST = "demoprovisioningrequest:list"
    ROLE_LIST = "role:list"
    ROLE_CREATE = "role:create"
    ROLE_DELETE = "role:delete"
    ROLE_UPDATE = "role:update"
    ORG_VIEW_SETTINGS = "organization:view_settings"
    ORG_EDIT_SETTINGS = "organization:edit_settings"
    ORG_DEPLOYMENT_DOCTOR = "organization:deployment_doctor"
    ORG_LIST_CHILDREN = "organization:list_children"
    ORG_CREATE_CHILD_ORGANIZATION = "organization:create_child_organization"
    ORG_AUDIT_USERS = "audit:users"
    ORG_AUDIT_ROLES = "audit:roles"
    ORG_AUDIT_DATASOURCES = "audit:datasources"
    ORG_AUDIT_NODES = "audit:nodes"
    ORG_AUDIT_PERMISSIONS = "audit:permissions"
    ORG_AUDIT_QUERIES = "audit:queries"
    ORG_AUDIT_ACTIVITIES = "audit:activities"
    ORG_AUDIT_SSH = "audit:ssh"
    ORG_AUDIT_ACCOUNT_GRANTS = "audit:accountgrants"
    ORG_AUDIT_ORG = "audit:organization"
    ORG_AUDIT_REMOTE_IDENTITIES = "audit:remoteidentities"
    ORG_AUDIT_REMOTE_IDENTITY_GROUPS = "audit:remoteidentitygroups"
    ORG_AUDIT_SECRET_STORES = "audit:secretstores"
    WORKFLOW_LIST = "workflow:list"
    WORKFLOW_EDIT = "workflow:edit"
    ACCESS_REQUEST_EDIT = "accessrequest:edit"
    ACCESS_REQUEST_LIST = "accessrequest:list"
    ACCESS_REQUEST_REQUESTER = "accessrequest:requester"
    GLOBAL_RDP_RENDER = "rdp:render"
    GLOBAL_QUERY_BUCKET_TRACKER = "query:bucket_tracker"
    GLOBAL_ASSETS_GET_LATEST_VERSION_COMMIT_HASH = "assets:get_latest_version_commit_hash"
    GLOBAL_SDMOS_SERVICE = "sdmos:service"
    GLOBAL_SDMOS_DEPLOYMENT = "sdmos:deployment"
    GLOBAL_SDMOS_RELEASE = "sdmos:release"
    GLOBAL_DEMO_PROVISIONER = "demo:provision"
    INSTALLATION_BLESS = "installation:bless"
    INSTALLATION_CREATE = "installation:create"
    INSTALLATION_REVOKE = "installation:revoke"
    TESTING_ORG_CREATE = "testing:organization:create"
    TESTING_ORG_DELETE = "testing:organization:delete"
    TESTING_NO_PERMISSIONS = "testing:noperms"
    TESTING_FETCH_QUERIES = "testing:queries:get"
    GRANT_READ = "grant:read"
    GRANT_WRITE = "grant:write"
    REPORT_READ = "report:read"
  end

  # Query Categories, all the categories of resource against which queries are logged.
  module QueryCategory
    KUBERNETES = "k8s"
    DATASOURCES = "queries"
    RDP = "rdp"
    SSH = "ssh"
    WEB = "web"
    CLOUD = "cloud"
    ALL = "all"
  end

  # LogRemoteEncoder defines the encryption encoder for the queries are stored in the API.
  module LogRemoteEncoder
    STRONG_DM = "strongdm"
    PUB_KEY = "pubkey"
    HASH = "hash"
  end

  # LogLocalStorage defines how queries are stored locally.
  module LogLocalStorage
    STDOUT = "stdout"
    FILE = "file"
    TCP = "tcp"
    SOCKET = "socket"
    SYSLOG = "syslog"
    NONE = "none"
  end

  # LogLocalEncoder defines the encryption encoder for queries are stored locally in the relay.
  module LogLocalEncoder
    PLAINTEXT = "plaintext"
    PUB_KEY = "pubkey"
  end

  # LogLocalFormat defines the format the queries are stored locally in the relay.
  module LogLocalFormat
    CSV = "csv"
    JSON = "json"
  end

  # OrgKind defines the types of organizations that may exist.
  module OrgKind
    SOLO = "solo"
    ROOT = "root"
    CHILD = "child"
  end

  # KeyType defines the supported SSH key types
  module SSHKeyType
    RSA_2048 = "rsa-2048"
    RSA_4096 = "rsa-4096"
    ECDSA_256 = "ecdsa-256"
    ECDSA_384 = "ecdsa-384"
    ECDSA_521 = "ecdsa-521"
    ED_25519 = "ed25519"
  end

  # CaptureType designates what type of SSH/RDP/K8s capture we have.
  module CaptureType
    SHELL = "shell"
    SCP_UPLOAD = "scp-upload"
    SCP_DOWNLOAD = "scp-download"
    COMMAND = "command"
    RDP_BASIC = "rdp-basic"
    RDP_ENHANCED = "rdp-enhanced"
    K_8_S_EXEC = "k8s-exec"
    K_8_S_EXEC_TTY = "k8s-execTTY"
    K_8_S_PORT_FORWARD = "k8s-portForward"
    K_8_SCP_UPLOAD = "k8s-cp-upload"
    K_8_SCP_DOWNLOAD = "k8s-cp-download"
    K_8_S_DESCRIBE = "k8s-describe"
    K_8_S_GET = "k8s-get"
    K_8_S_DELETE = "k8s-delete"
    K_8_S_GENERIC = "k8s-generic"
    K_8_S_APPLY = "k8s-apply"
    SSH_PORT_FORWARD = "ssh-portForward"
  end
end
