# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nested_hash_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "nested_hash_helper"
  spec.version       = NestedHashHelper::VERSION
  spec.authors       = ["vivek n"]
  spec.email         = ["vivekn@freshdesk.com"]

  spec.summary       = %q{NestedHashHelper to deal with nested Hashes.}
  spec.description   = %q{This gem eases your life in dealing with nested Hashes While building Rails apps.}
  spec.homepage      = "https://github.com/vivek3894/nested_hash_helper"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
