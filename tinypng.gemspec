# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinypng/version'

Gem::Specification.new do |gem|
  gem.name          = "tinypng"
  gem.version       = TinyPNG::VERSION
  gem.authors       = ["Benjamin Manns"]
  gem.email         = ["benmanns@gmail.com"]
  gem.description   = %q{Simple API client for TinyPNG.org.}
  gem.summary       = %q{TinyPNG is a simple API client for TinyPNG.org, which compresses your PNG images by 50-70% while preserving full transparency.}
  gem.homepage      = 'http://github.com/benmanns/tinypng'

  gem.add_dependency 'httparty'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
