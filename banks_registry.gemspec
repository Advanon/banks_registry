# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'banks_registry/version'

Gem::Specification.new do |spec|
  spec.name          = 'banks_registry'
  spec.version       = BanksRegistry::VERSION
  spec.authors       = ['Advanon team']
  spec.email         = ['team@advanon.com']

  spec.summary       = 'Banks registry gem.'
  spec.description   = 'Banks registry gem.'
  spec.homepage      = 'https://advanon.com'

  raise 'Push protection unavailable' unless spec.respond_to?(:metadata)

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.60.0'
end
