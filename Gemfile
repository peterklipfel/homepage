source 'https://rubygems.org'

gem 'rails', '4.0.0'

gem 'thin'
gem 'redcarpet'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'compass-rails'

  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
  gem 'zurb-foundation'
end

gem 'jquery-rails'
# gem 'cloudfoundry-jquery-rails'

group :production do
  gem "unicorn"
end

group :development do
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'rvm-capistrano'
end

gem 'sqlite3'  
