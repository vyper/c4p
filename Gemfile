source 'https://rubygems.org'

ruby '2.3.0'

gem 'bundler'
gem 'rake'

# Hanami framework
gem 'hanami',       '0.7.2'
gem 'hanami-model', '~> 0.5'

# Database
gem 'pg'

# Auth
gem 'bcrypt'
gem 'omniauth-facebook'
gem 'omniauth-github'

# Front (:
gem 'bitters'

group :development, :test do
  gem 'pry-byebug'

  # Coverage
  gem 'codeclimate-test-reporter', require: nil
end

group :test do
  gem 'rspec'
  gem 'capybara'

  gem 'shoulda-hanami'
end

group :production do
  gem 'puma'
end
