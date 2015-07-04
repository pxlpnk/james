# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'james/version'

Gem::Specification.new do |spec|
  spec.name          = "james"
  spec.version       = James::VERSION
  spec.authors       = ["Andreas Tiefenthaler"]
  spec.email         = ["at@an-ti.eu"]

  spec.summary       = %q{Simple helper for everyday tasks}
  spec.homepage      = "http://james.an-ti.eu"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_dependency "claide"
  spec.add_dependency "hashie"
  spec.add_dependency "forecast_io"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "awesome_print"
end
