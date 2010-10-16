source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

gem 'haml', "~>3.0.18"
gem 'devise', "~>1.1.2"
gem 'autotest'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

group :development do
  gem 'cucumber-rails', "~>0.3.2"
  gem 'haml-rails', "~>0.3.1"
  gem 'rspec-rails', "~>2.0.0"
  
  # gems for Devise
  gem 'hpricot', "~>0.8.2"
  gem 'ruby_parser', "~>2.0.5"
end

group :development, :test do
  gem 'rspec'
  gem 'factory_girl'
  
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'
end
