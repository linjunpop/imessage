# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imessage/version'

Gem::Specification.new do |spec|
  spec.name          = "imessage"
  spec.version       = Imessage::VERSION
  spec.authors       = ["Jun Lin"]
  spec.email         = ["linjunpop@gmail.com"]
  spec.description   = "Command line tool to send iMessage."
  spec.summary       = "Command line tool to send iMessage."
  spec.homepage      = "https://github.com/linjunpop/imessage"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~> 2.14'

  spec.add_runtime_dependency 'gli','~> 2.8.1'
end
