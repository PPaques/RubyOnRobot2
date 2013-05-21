source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
# to use a worker to get states periodicly
gem 'clockwork',  '~> 0.5.0'
gem 'tzinfo',     '~> 0.3.35'
# use for communication
gem 'bootstrap-generators', '~> 2.3'
gem 'jquery-rails'
gem 'simple_form'
gem 'haml-rails'
gem 'nested_form'
gem 'acts_as_list'
gem 'better_logging'
gem 'colored'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.3.1.0'
  # to precompile assets faster
  gem 'turbo-sprockets-rails3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
group :development, :test do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-unicorn', :require => false
  gem 'better_errors'
  gem 'rails-erd'
end


# To use debugger
# gem 'debugger'
