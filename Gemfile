# encoding: utf-8

# If you do not have OpenSSL installed, update
# the following line to use "http://" instead
source 'https://rubygems.org'

# Specify your gem's dependencies in middleman-patterns.gemspec
gemspec

gem 'middleman-core', :path => '../middleman/middleman-core'
group :development do
  gem 'yard', '~> 0.8.7'
  gem 'rubocop', '~> 0.28'
  gem 'rake', '~> 10.4.2'
end

group :test do
  gem 'simplecov', '~> 0.9'
  gem 'rspec', '~> 3.1.0'
  gem 'fivemat', '~> 1.3.1'
  gem 'cucumber', '~> 1.3.18'
  gem 'aruba', '~> 0.6.2'
  gem 'haml', '~> 4.0.6'
end
