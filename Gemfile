source 'http://rubygems.org'

gem 'spree', '1.0.3'
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.12'

group :development do
  gem "rspec-rails", "~> 2.6"
end

group :test do
  gem 'ffaker'
  gem "rspec-rails", "~> 2.6" 
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

gemspec
