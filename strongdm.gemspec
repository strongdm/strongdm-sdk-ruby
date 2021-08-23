# -*- encoding: utf-8 -*-
require File.expand_path("../lib/version.rb", __FILE__)

Gem::Specification.new do |s|
  s.name = "strongdm"
  s.version = SDM::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["strongDM Team"]
  s.email = ["sdk-feedback@strongdm.com"]
  s.homepage = "https://github.com/strongdm/strongdm-sdk-ruby"
  s.summary = "strongDM SDK for the Ruby programming language."
  s.description = "strongDM Ruby Library for automating interactions with strongDM."
  s.licenses = ["Apache-2.0"]
  s.required_ruby_version = ">= 2.3.0"
  s.required_rubygems_version = ">= 1.3.6"

  s.add_runtime_dependency "grpc", "~> 1.27.0", ">= 1.27.0"
  s.add_runtime_dependency "grpc-tools", "~> 1.27.0", ">= 1.27.0"
  s.add_runtime_dependency "openssl", "~> 2.1.2", ">= 2.1.2"

  s.files = `find . | grep -v "strongdm-#{SDM::VERSION}.gem"`.split("\n")
  s.require_path = "lib"
end
