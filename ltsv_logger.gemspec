# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ltsv_logger"

Gem::Specification.new do |spec|
  spec.name          = "ltsv_logger"
  spec.version       = LtsvLogger::VERSION
  spec.authors       = ["Yuya.Nishida."]
  spec.email         = ["yuya@j96.org"]
  spec.description   = "A logger implementation for LTSV format"
  spec.summary       = "A logger implementation for LTSV format"
  spec.homepage      = "https://github.com/nishidayuya/ltsv_logger"
  spec.license       = "X11"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ltsv", "~> 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
