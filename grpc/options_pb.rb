# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: options.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("options.proto", :syntax => :proto3) do
    add_message "v1.FieldOptions" do
      optional :name, :string, 1941300
      optional :sql_nullable, :bool, 1941301
    end
    add_message "v1.MessageOptions" do
      optional :name, :string, 1941300
    end
    add_message "v1.OneofOptions" do
      optional :model_name, :string, 1941380
    end
  end
end

module V1
  FieldOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.FieldOptions").msgclass
  MessageOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.MessageOptions").msgclass
  OneofOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("v1.OneofOptions").msgclass
end
