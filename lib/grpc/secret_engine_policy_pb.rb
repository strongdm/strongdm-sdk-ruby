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
# source: secret_engine_policy.proto

require "google/protobuf"

require "options_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("secret_engine_policy.proto", :syntax => :proto3) do
    add_message "v1.SecretEnginePasswordPolicy" do
      optional :length, :uint32, 1
      optional :exclude_upper_case, :bool, 2
      optional :num_digits, :uint32, 3
      optional :num_symbols, :uint32, 4
      optional :allow_repeat, :bool, 5
      optional :exclude_characters, :string, 6
    end
    add_message "v1.SecretEnginePolicy" do
      optional :password_policy, :message, 1, "v1.SecretEnginePasswordPolicy"
    end
  end
end

module V1
  SecretEnginePasswordPolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.SecretEnginePasswordPolicy").msgclass
  SecretEnginePolicy = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.SecretEnginePolicy").msgclass
end
