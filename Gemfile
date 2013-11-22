source 'https://rubygems.org'
ruby '2.0.0'

# FRAMEWORK
gem 'rails', '3.2.13'

# SERVER
gem 'unicorn'
gem 'unicorn-rails'
group :test, :development do
  gem 'foreman'
end

# DB
gem 'pg', '~> 0.16.0'
gem 'taps'
# gem 'redis'
# gem 'redis-objects'

# LOCATION
# gem 'rgeo'
# gem 'activerecord-postgis-adapter'
gem 'geocoder'

# JSON API
gem 'rocket_pants'
gem 'active_model_serializers'

# AUTHENTICATION
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'opro'

# FILE STORAGE
gem 'paperclip', '~> 3.0'
gem 'delayed_paperclip'
gem 'aws-sdk'
gem 'exifr'

# CACHE
gem 'rack-cache'
gem 'memcachier'
gem 'dalli'
gem 'kgio'

# MODELS
gem 'pacecar'

# TESTING
group :test, :development do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
  gem 'faker'
  gem 'database_cleaner'
  gem 'rest-client'
end

# ERROR HANDLING
group :development do
  gem 'better_errors'
end

# LOGS
gem 'lograge'

# DEVELOPMENT ASSISTANCE
group :development do
  gem 'annotate'
end

# GUARD
group :development, :test do
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-annotate'
end

# QUEUE
gem 'delayed_job'
gem 'daemons'
group :production do
  gem 'iron_mq'
  gem 'delayed_job_ironmq'
end

# MONITORING
# gem 'appsignal'
# gem 'newrelic_rpm'

# OBJECT QUERIES
gem 'will_paginate'

# EXTERNAL API LIBRARIES
gem 'fb_graph'

# HEROKU
gem 'rails_12factor'

# ANALYTICS / DATASET
gem 'keen'