lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'imessage/version'

Gem::Specification.new do |spec|
  spec.name          = 'imessage'
  spec.version       = Imessage::VERSION
  spec.authors       = ['Jun Lin']
  spec.email         = ['linjunpop@gmail.com']

  spec.summary       = 'Command line tool to send iMessage.'
  spec.description   = 'Command line tool to send iMessage.'
  spec.homepage      = 'https://github.com/linjunpop/imessage'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
end
