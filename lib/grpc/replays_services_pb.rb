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
# Source: replays.proto for package 'v1'

require "grpc"
require "replays_pb"

module V1
  module Replays
    # A Replay captures the data transferred over a long-running SSH, RDP, or Kubernetes interactive session
    # (otherwise referred to as a query). The Replays service is read-only.
    class Service
      include ::GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.Replays"

      # List gets a list of ReplayChunks for the Query ID specified by the filter criteria.
      rpc :List, ::V1::ReplayListRequest, ::V1::ReplayListResponse
    end

    Stub = Service.rpc_stub_class
  end
end