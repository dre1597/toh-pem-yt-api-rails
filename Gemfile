# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.1'

gem 'active_model_serializers', '~> 0.10.14'
gem 'bootsnap', require: false
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.1'
gem 'rubocop', '~> 1.57', require: false
gem 'sqlite3', '~> 1.4'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'rspec-rails', '~> 6.0'
end

group :development do
  gem 'faker', '~> 3.2'
end

group :test do
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0', require: false
end
