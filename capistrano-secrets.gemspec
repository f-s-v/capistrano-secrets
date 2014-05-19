# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "capistrano-secrets"
  gem.version       = '0.0.1'
  gem.authors       = ["Vadim Rastyagaev"]
  gem.email         = ["rastyagaev@gmail.com"]
  gem.description   = %q{Load application secrets from heroku app environment.}
  gem.summary       = %q{Load application secrets from heroku app environment.}
  gem.homepage      = "https://github.com/f-s-v/capistrano-secrets"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano', '~> 3.1'
end
