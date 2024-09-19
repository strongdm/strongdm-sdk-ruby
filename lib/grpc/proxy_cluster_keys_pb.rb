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
# source: proxy_cluster_keys.proto

require "google/protobuf"

require "google/protobuf/timestamp_pb"
require "options_pb"
require "spec_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("proxy_cluster_keys.proto", :syntax => :proto3) do
    add_message "v1.ProxyClusterKeyCreateRequest" do
      optional :meta, :message, 1, "v1.CreateRequestMetadata"
      optional :proxy_cluster_key, :message, 2, "v1.ProxyClusterKey"
    end
    add_message "v1.ProxyClusterKeyCreateResponse" do
      optional :meta, :message, 1, "v1.CreateResponseMetadata"
      optional :proxy_cluster_key, :message, 2, "v1.ProxyClusterKey"
      optional :secret_key, :string, 3
      optional :rate_limit, :message, 4, "v1.RateLimitMetadata"
    end
    add_message "v1.ProxyClusterKeyGetRequest" do
      optional :meta, :message, 1, "v1.GetRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ProxyClusterKeyGetResponse" do
      optional :meta, :message, 1, "v1.GetResponseMetadata"
      optional :proxy_cluster_key, :message, 2, "v1.ProxyClusterKey"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ProxyClusterKeyDeleteRequest" do
      optional :meta, :message, 1, "v1.DeleteRequestMetadata"
      optional :id, :string, 2
    end
    add_message "v1.ProxyClusterKeyDeleteResponse" do
      optional :meta, :message, 1, "v1.DeleteResponseMetadata"
      optional :rate_limit, :message, 2, "v1.RateLimitMetadata"
    end
    add_message "v1.ProxyClusterKeyListRequest" do
      optional :meta, :message, 1, "v1.ListRequestMetadata"
      optional :filter, :string, 2
    end
    add_message "v1.ProxyClusterKeyListResponse" do
      optional :meta, :message, 1, "v1.ListResponseMetadata"
      repeated :proxy_cluster_keys, :message, 2, "v1.ProxyClusterKey"
      optional :rate_limit, :message, 3, "v1.RateLimitMetadata"
    end
    add_message "v1.ProxyClusterKey" do
      optional :id, :string, 1
      optional :proxy_cluster_id, :string, 2
      optional :created_at, :message, 3, "google.protobuf.Timestamp"
      optional :last_used_at, :message, 4, "google.protobuf.Timestamp"
    end
  end
end

module V1
  ProxyClusterKeyCreateRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyCreateRequest").msgclass
  ProxyClusterKeyCreateResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyCreateResponse").msgclass
  ProxyClusterKeyGetRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyGetRequest").msgclass
  ProxyClusterKeyGetResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyGetResponse").msgclass
  ProxyClusterKeyDeleteRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyDeleteRequest").msgclass
  ProxyClusterKeyDeleteResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyDeleteResponse").msgclass
  ProxyClusterKeyListRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyListRequest").msgclass
  ProxyClusterKeyListResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKeyListResponse").msgclass
  ProxyClusterKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ProxyClusterKey").msgclass
end
