# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid/document_locker/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid-document_locker"
  spec.version       = Mongoid::DocumentLocker::VERSION
  spec.authors       = ["josisusan"]
  spec.email         = ["josisusan@gmail.com"]
  spec.summary       = %q{Lock the document}
  spec.description   = %q{Lock the document after it is valid.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
