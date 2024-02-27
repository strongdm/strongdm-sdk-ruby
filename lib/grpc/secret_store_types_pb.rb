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
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: secret_store_types.proto

require "google/protobuf"

require "options_pb"
require "tags_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("secret_store_types.proto", :syntax => :proto3) do
    add_message "v1.SecretStore" do
      oneof :secret_store do
        optional :aws, :message, 3, "v1.AWSStore"
        optional :aws_cert_x_509, :message, 30, "v1.AWSCertX509Store"
        optional :azure, :message, 101, "v1.AzureStore"
        optional :cyberark_conjur, :message, 301, "v1.CyberarkConjurStore"
        optional :cyberark_pam, :message, 303, "v1.CyberarkPAMStore"
        optional :cyberark_pam_experimental, :message, 302, "v1.CyberarkPAMExperimentalStore"
        optional :delinea, :message, 2900, "v1.DelineaStore"
        optional :gcp, :message, 201, "v1.GCPStore"
        optional :gcp_cert_x_509, :message, 202, "v1.GCPCertX509Store"
        optional :vault_app_role, :message, 4, "v1.VaultAppRoleStore"
        optional :vault_app_role_cert_ssh, :message, 94, "v1.VaultAppRoleCertSSHStore"
        optional :vault_app_role_cert_x_509, :message, 95, "v1.VaultAppRoleCertX509Store"
        optional :vault_tls, :message, 1, "v1.VaultTLSStore"
        optional :vault_tls_cert_ssh, :message, 92, "v1.VaultTLSCertSSHStore"
        optional :vault_tls_cert_x_509, :message, 93, "v1.VaultTLSCertX509Store"
        optional :vault_token, :message, 2, "v1.VaultTokenStore"
        optional :vault_token_cert_ssh, :message, 90, "v1.VaultTokenCertSSHStore"
        optional :vault_token_cert_x_509, :message, 91, "v1.VaultTokenCertX509Store"
      end
    end
    add_message "v1.AWSStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :region, :string, 3
      optional :tags, :message, 4, "v1.Tags"
    end
    add_message "v1.AWSCertX509Store" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :caArn, :string, 5
      optional :certificateTemplateArn, :string, 7
      optional :issuedCertTTLMinutes, :string, 8
      optional :region, :string, 3
      optional :signingAlgo, :string, 6
      optional :tags, :message, 4, "v1.Tags"
    end
    add_message "v1.AzureStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :vault_uri, :string, 3
      optional :tags, :message, 32771, "v1.Tags"
    end
    add_message "v1.CyberarkConjurStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :appURL, :string, 3
      optional :tags, :message, 32771, "v1.Tags"
    end
    add_message "v1.CyberarkPAMStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :appURL, :string, 3
      optional :tags, :message, 32771, "v1.Tags"
    end
    add_message "v1.CyberarkPAMExperimentalStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :appURL, :string, 3
      optional :tags, :message, 32771, "v1.Tags"
    end
    add_message "v1.DelineaStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :server_url, :string, 3
      optional :tenant_name, :string, 4
      optional :tags, :message, 32771, "v1.Tags"
    end
    add_message "v1.GCPStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :projectID, :string, 3
      optional :tags, :message, 32771, "v1.Tags"
    end
    add_message "v1.GCPCertX509Store" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :caID, :string, 6
      optional :caPoolID, :string, 5
      optional :location, :string, 4
      optional :projectID, :string, 3
      optional :tags, :message, 32771, "v1.Tags"
    end
    add_message "v1.VaultAppRoleStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :server_address, :string, 3
      optional :tags, :message, 8, "v1.Tags"
    end
    add_message "v1.VaultAppRoleCertSSHStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :server_address, :string, 3
      optional :signing_role, :string, 7
      optional :ssh_mount_point, :string, 6
      optional :tags, :message, 8, "v1.Tags"
    end
    add_message "v1.VaultAppRoleCertX509Store" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :pki_mount_point, :string, 6
      optional :server_address, :string, 3
      optional :signing_role, :string, 7
      optional :tags, :message, 8, "v1.Tags"
    end
    add_message "v1.VaultTLSStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :CA_cert_path, :string, 4
      optional :client_cert_path, :string, 5
      optional :client_key_path, :string, 6
      optional :namespace, :string, 8
      optional :server_address, :string, 3
      optional :tags, :message, 7, "v1.Tags"
    end
    add_message "v1.VaultTLSCertSSHStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :CA_cert_path, :string, 4
      optional :client_cert_path, :string, 5
      optional :client_key_path, :string, 6
      optional :namespace, :string, 8
      optional :server_address, :string, 3
      optional :signing_role, :string, 10
      optional :ssh_mount_point, :string, 9
      optional :tags, :message, 7, "v1.Tags"
    end
    add_message "v1.VaultTLSCertX509Store" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :CA_cert_path, :string, 4
      optional :client_cert_path, :string, 5
      optional :client_key_path, :string, 6
      optional :namespace, :string, 8
      optional :pki_mount_point, :string, 9
      optional :server_address, :string, 3
      optional :signing_role, :string, 10
      optional :tags, :message, 7, "v1.Tags"
    end
    add_message "v1.VaultTokenStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :server_address, :string, 3
      optional :tags, :message, 4, "v1.Tags"
    end
    add_message "v1.VaultTokenCertSSHStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :server_address, :string, 3
      optional :signing_role, :string, 7
      optional :ssh_mount_point, :string, 6
      optional :tags, :message, 4, "v1.Tags"
    end
    add_message "v1.VaultTokenCertX509Store" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :pki_mount_point, :string, 6
      optional :server_address, :string, 3
      optional :signing_role, :string, 7
      optional :tags, :message, 4, "v1.Tags"
    end
  end
end

module V1
  SecretStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.SecretStore").msgclass
  AWSStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AWSStore").msgclass
  AWSCertX509Store = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AWSCertX509Store").msgclass
  AzureStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AzureStore").msgclass
  CyberarkConjurStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CyberarkConjurStore").msgclass
  CyberarkPAMStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CyberarkPAMStore").msgclass
  CyberarkPAMExperimentalStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CyberarkPAMExperimentalStore").msgclass
  DelineaStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.DelineaStore").msgclass
  GCPStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.GCPStore").msgclass
  GCPCertX509Store = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.GCPCertX509Store").msgclass
  VaultAppRoleStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultAppRoleStore").msgclass
  VaultAppRoleCertSSHStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultAppRoleCertSSHStore").msgclass
  VaultAppRoleCertX509Store = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultAppRoleCertX509Store").msgclass
  VaultTLSStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTLSStore").msgclass
  VaultTLSCertSSHStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTLSCertSSHStore").msgclass
  VaultTLSCertX509Store = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTLSCertX509Store").msgclass
  VaultTokenStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTokenStore").msgclass
  VaultTokenCertSSHStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTokenCertSSHStore").msgclass
  VaultTokenCertX509Store = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTokenCertX509Store").msgclass
end
