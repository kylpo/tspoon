source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem "timestamper", :path => "lib/timestamper/"

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem "bcrypt-ruby", :require => "bcrypt"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  # Pretty printed test output
  gem 'turn', :require => false
	gem 'rspec-rails'
	gem 'webrat'
	gem 'execjs'
	gem 'therubyracer'
end
