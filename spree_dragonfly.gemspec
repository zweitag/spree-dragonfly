# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_dragonfly'
  s.version     = '1.0.0'
  s.summary     = 'Spree Dragonfly Extension'
  s.description = 'Exchange paperclip with dragonfly for image processing in Spree.'
  s.required_ruby_version = '>= 1.8.7'

  s.author            = 'Oliver Kiessler'
  s.email             = 'kiessler@inceedo.com'
  s.homepage          = 'http://www.zweitag.de'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.1.0'
  s.add_dependency 'dragonfly', '~> 0.9.12'

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.6'
  s.add_development_dependency 'sqlite3'
end
