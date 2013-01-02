# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mystro/client/version'

Gem::Specification.new do |gem|
  gem.name          = "mystro-client"
  gem.version       = Mystro::Client::Version::STRING
  gem.authors       = ["Shawn Catanzarite"]
  gem.email         = ["me@shawncatz.com"]
  gem.description   = %q{mystro client}
  gem.summary       = %q{mystro client}
  gem.homepage      = "http://github.com/mystro/client"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "httparty" # talk to server's json api
  gem.add_dependency "docopt"
end
