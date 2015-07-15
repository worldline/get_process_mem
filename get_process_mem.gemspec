# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_process_mem/version'

Gem::Specification.new do |gem|
  gem.name          = "get_process_mem-1-8-7"
  gem.version       = GetProcessMem::VERSION
  gem.authors       = ["Romain Philibert"]
  gem.email         = ["Filirom1@gmail.com"]
  gem.description   = %q{ Get memory usage of a process in Ruby }
  gem.summary       = %q{ Use GetProcessMem to find out the amount of RAM used by any process }
  gem.homepage      = "https://github.com/worldline/get_process_mem"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake",  "~> 10.1"
end
