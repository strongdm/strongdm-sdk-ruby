# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: options.proto

require "google/protobuf"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("options.proto", :syntax => :proto3) do
    add_message "v1.FieldOptions" do
      optional :name, :string, 1941300
      optional :sql_nullable, :bool, 1941301
      optional :expose_as_porcelain, :bool, 1941302
      optional :iterable, :bool, 1941303
      optional :required, :bool, 1941304
      optional :id_type, :string, 1941305
    end
    add_message "v1.MessageOptions" do
      optional :model_name, :string, 1941300
      optional :porcelain, :bool, 1941301
      optional :error, :int32, 1941302
    end
    add_message "v1.OneofOptions" do
      optional :model_name, :string, 1941380
    end
    add_message "v1.ServiceOptions" do
      optional :main_noun, :string, 1941400
    end
  end
end

module V1
  FieldOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.FieldOptions").msgclass
  MessageOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.MessageOptions").msgclass
  OneofOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.OneofOptions").msgclass
  ServiceOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.ServiceOptions").msgclass
end
