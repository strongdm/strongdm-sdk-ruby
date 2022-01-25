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
# source: options.proto

require "google/protobuf"

require "google/protobuf/descriptor_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("options.proto", :syntax => :proto3) do
    add_message "v1.MethodOptions" do
      optional :method, :string, 1941300
      optional :url, :string, 1941301
    end
    add_message "v1.FileOptions" do
      optional :private_sdk, :bool, 1941700
    end
    add_message "v1.FieldOptions" do
      optional :expose_as_porcelain, :bool, 1941302
      optional :iterable, :bool, 1941303
      optional :required, :bool, 1941304
      optional :write_only, :bool, 1941309
      optional :read_only, :bool, 1941315
      optional :is_credential, :bool, 1941316
      optional :private_sdk, :bool, 1941318
      optional :terraform_computed, :string, 1941307
      optional :terraform_force_new, :bool, 1941308
      optional :terraform_sensitive, :bool, 1941310
      optional :terraform_diff_suppress_func, :string, 1941319
      optional :terraform_comment_override, :string, 1941320
      optional :cli_name, :string, 1941311
      optional :cli_json_name, :string, 1941312
      optional :json_gateway_name, :string, 1941313
      optional :hide_from_json_gateway, :bool, 1941314
    end
    add_message "v1.MessageOptions" do
      optional :porcelain, :bool, 1941301
      optional :error, :int32, 1941302
      optional :options_field, :string, 1941303
      optional :custom, :message, 1941305, "v1.CustomPorcelainMessageOptions"
      optional :private_sdk, :bool, 1941306
      optional :cli_name, :string, 1941307
      optional :cli_json_name, :string, 1941308
      optional :json_gateway_name, :string, 1941309
      optional :hide_from_json_gateway, :bool, 1941310
      optional :terraform_docs, :message, 1941304, "v1.TerraformDocs"
      optional :terraform_provider_name, :string, 1941311
    end
    add_message "v1.CustomPorcelainMessageOptions" do
      optional :converter, :string, 1941309
      optional :go_porcelain_type, :string, 1941310
      optional :java_porcelain_type, :string, 1941311
      optional :terraform_porcelain_type, :string, 1941312
      optional :openapi_porcelain_type, :string, 1941313
    end
    add_message "v1.TerraformDocs" do
      optional :resource_example_path, :string, 1941300
      optional :data_source_example_path, :string, 1941301
    end
    add_message "v1.OneofOptions" do
      repeated :common_fields, :string, 1941381
    end
    add_message "v1.ServiceOptions" do
      optional :main_noun, :string, 1941400
      optional :private_sdk, :bool, 1941401
    end
  end
end

module V1
  MethodOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.MethodOptions").msgclass
  FileOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.FileOptions").msgclass
  FieldOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.FieldOptions").msgclass
  MessageOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.MessageOptions").msgclass
  CustomPorcelainMessageOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.CustomPorcelainMessageOptions").msgclass
  TerraformDocs = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.TerraformDocs").msgclass
  OneofOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.OneofOptions").msgclass
  ServiceOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ServiceOptions").msgclass
end
