# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "opic"
  spec.version       = "0.0.2"
  spec.authors       = ["Kyle Decot"]
  spec.email         = ["decot.7@osu.edu"]
  spec.description   = %q{Rubygem for interacting w/ the Opic API}
  spec.summary       = %q{Rubygem for interacting w/ the Opic API}
  spec.homepage      = "http://opic.osu.edu/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
