# frozen_string_literal: true

ruby File.read(File.join(__dir__, '.ruby-version')).strip

# Pull gem index from rubygems
source 'https://rubygems.org'

# Pin the version of bundle we support
gem 'bundler', File.read(File.join(__dir__, '.bundler-version')).strip

# Dependencies for connectors
gem 'activesupport', '5.2.6'
gem 'bson', '~> 4.2.2'
gem 'mime-types', '= 3.1'
gem 'tzinfo-data', '= 1.2022.1'
gem 'tzinfo', '1.2.10'
gem 'nokogiri', '>= 1.13.7', :require => false
gem 'fugit', '~> 1.5.3'
gem 'remedy', '~> 0.3.0'

group :test do
  gem 'rspec-collection_matchers', '~> 1.2.0'
  gem 'rspec-core', '~> 3.10.1'
  gem 'rspec_junit_formatter'
  gem 'rubocop', '1.18.4'
  gem 'rubocop-performance', '1.11.5'
  gem 'rspec-mocks'
  gem 'webmock'
  gem 'rack', '>= 2.2.3.1'
  gem 'rack-test'
  gem 'ruby-debug-ide'
  gem 'pry-remote'
  gem 'pry-nav'
  gem 'debase', '0.2.5.beta2'
  gem 'timecop'
  gem 'simplecov', require: false
  gem 'simplecov-material'
end

# Dependencies for the HTTP service
gem 'config', '~> 4.0.0'
gem 'forwardable', '~> 1.3.2'
gem 'faraday', '~> 1.10.0'
gem 'faraday_middleware', '= 1.0.0'
gem 'httpclient', '~> 2.8.3'
gem 'attr_extras', '~> 6.2.5'
gem 'hashie', '~> 5.0.0'
gem 'concurrent-ruby', '~> 1.1.9'
gem 'elasticsearch'

# Dependencies for oauth
gem 'signet', '~> 0.16.0'

# Dependency for mongo connector
gem 'mongo', '~> 2.4.3'
