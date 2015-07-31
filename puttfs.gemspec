# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'puttfs/version'

Gem::Specification.new do |spec|
  spec.name          = "puttfs"
  spec.version       = Puttfs::VERSION
  spec.authors       = ["Tim Wade"]
  spec.email         = ["hello@timjwade.com"]

  spec.summary       = %{A debugging tool that helps make your `puts` statements more visible.}
  spec.homepage      = "https://github.com/imtayadeway/puttfs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
