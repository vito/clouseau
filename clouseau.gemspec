# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "clouseau/version"

Gem::Specification.new do |s|
  s.name        = "clouseau"
  s.version     = Clouseau::VERSION
  s.authors     = ["Alex Suraci"]
  s.email       = ["asuraci@vmware.com"]
  s.homepage    = "http://cloudfoundry.com/"
  s.summary     = %q{
    High-level library for working with the Cloud Foundry API.
  }

  s.rubyforge_project = "clouseau"

  s.files         = %w{LICENSE Rakefile} + Dir.glob("lib/**/*")
  s.test_files    = Dir.glob("spec/**/*")
  s.require_paths = ["lib"]

  s.add_dependency "rubyzip", "~> 0.9.9"

  s.add_development_dependency "rake", "~> 0.9.2.2"
  s.add_development_dependency "rspec", "~> 2.11.0"
end
