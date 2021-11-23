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
# Source: control_panel.proto for package 'v1'

require "grpc"
require "control_panel_pb"

module V1
  module ControlPanel
    # ControlPanel contains all administrative controls.
    class Service
      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = "v1.ControlPanel"

      # GetSSHCAPublicKey retrieves the SSH CA public key.
      rpc :GetSSHCAPublicKey, ControlPanelGetSSHCAPublicKeyRequest, ControlPanelGetSSHCAPublicKeyResponse
      # VerifyJWT reports whether the given JWT token (x-sdm-token) is valid.
      rpc :VerifyJWT, ControlPanelVerifyJWTRequest, ControlPanelVerifyJWTResponse
    end

    Stub = Service.rpc_stub_class
  end
end
