# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grapeful/version'

Gem::Specification.new do |spec|
  spec.name          = "grapeful"
  spec.version       = Grapeful::VERSION
  spec.authors       = ["Zolzaya E."]
  spec.email         = ["zolzaya.erdenebaatar@gmail.com"]
  spec.description   = "Custom Response builder for Grape"
  spec.summary       = "Custom Response builder for Grape"
  spec.homepage      = "https://github.com/zolzaya/grapeful"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "grape", "~> 0.6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
