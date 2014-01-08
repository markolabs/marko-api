source 'https://rubygems.org'
ruby '2.0.0'

# FRAMEWORK
gem 'rails', '3.2.13'

# SERVER
# gem 'unicorn'
# gem 'unicorn-rails'
gem 'puma'
# gem 'passenger'
group :test, :development do
  gem 'foreman'
end

# DB
gem 'pg', '~> 0.16.0'
gem 'taps'
# gem 'redis'
# gem 'redis-objects'

# ACTIVE RECORD
gem 'uuidtools'
gem 'activemodel'
gem 'acts_as_paranoid'
gem 'squeel'
gem 'rgeo-activerecord'
gem 'activerecord-postgis-adapter'
# gem 'rails-observers'

# DATABASE STRUCTURE

# LOCATION
gem 'rgeo'
gem 'geocoder'

# JSON API
gem 'oj'
gem 'rocket_pants'
gem 'active_model_serializers'

# AUTHENTICATION
gem 'cancan'

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
gem 'will_paginate'

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
  gem 'lol_dba'
  gem 'annotate'
  gem 'dotenv'
end

# GUARD
group :development, :test do
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-annotate'
end

# WORK QUEUE
gem 'delayed_job'
gem 'daemons'
group :production do
  gem 'iron_mq'
  gem 'delayed_job_ironmq'
end

# APPLE PUSH
gem 'zero_push'

# MONITORING
# gem 'honeybadger'
# gem 'appsignal'
# gem 'oboe-heroku'
gem 'newrelic_rpm'
gem 'rocket_pants-rpm'
gem 'mixpanel-rails'

# EXTERNAL API LIBRARIES
gem 'transloadit'
# gem 'iron_worker_ng'
gem 'fb_graph'

# HEROKU
gem 'rails_12factor'
