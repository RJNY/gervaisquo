# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gervais_quo/version'

Gem::Specification.new do |spec|
  spec.name          = "gervais_quo"
  spec.version       = GervaisQuo::VERSION
  spec.authors       = ["Richard Macias"]
  spec.email         = ["RJNY86@gmail.com"]
  spec.summary       = %q{Append gervais quotes to your application}
  spec.description   = %q{gervais_quo is middleware that appends gervais quotes to your application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.2.0'
end
