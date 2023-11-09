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
        optional :azure, :message, 101, "v1.AzureStore"
        optional :cyberark_conjur, :message, 301, "v1.CyberarkConjurStore"
        optional :cyberark_pam, :message, 303, "v1.CyberarkPAMStore"
        optional :cyberark_pam_experimental, :message, 302, "v1.CyberarkPAMExperimentalStore"
        optional :delinea, :message, 2900, "v1.DelineaStore"
        optional :gcp, :message, 201, "v1.GCPStore"
        optional :vault_app_role, :message, 4, "v1.VaultAppRoleStore"
        optional :vault_tls, :message, 1, "v1.VaultTLSStore"
        optional :vault_token, :message, 2, "v1.VaultTokenStore"
      end
    end
    add_message "v1.AWSStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :region, :string, 3
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
    add_message "v1.VaultAppRoleStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :server_address, :string, 3
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
    add_message "v1.VaultTokenStore" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :namespace, :string, 5
      optional :server_address, :string, 3
      optional :tags, :message, 4, "v1.Tags"
    end
  end
end

module V1
  SecretStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.SecretStore").msgclass
  AWSStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AWSStore").msgclass
  AzureStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.AzureStore").msgclass
  CyberarkConjurStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CyberarkConjurStore").msgclass
  CyberarkPAMStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CyberarkPAMStore").msgclass
  CyberarkPAMExperimentalStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CyberarkPAMExperimentalStore").msgclass
  DelineaStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.DelineaStore").msgclass
  GCPStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.GCPStore").msgclass
  VaultAppRoleStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultAppRoleStore").msgclass
  VaultTLSStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTLSStore").msgclass
  VaultTokenStore = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.VaultTokenStore").msgclass
end
