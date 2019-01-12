source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.3'

# A web-application framework
gem 'rails', '~> 5.2.1'

# App server
gem 'puma', '~> 3.11'

# webpack
gem 'webpacker', '~> 3.5'

# react
gem 'react-rails'

# Database
gem 'aasm'
gem 'pg', '0.18'
gem 'figaro'
gem 'lograge'
gem 'enumerize'
gem 'activestorage-aliyun'
gem 'action-store'

# Authorization
gem 'bcrypt'
gem 'openssl'
gem 'jwt'
gem 'jose'
# gem 'mixin_bot', github: 'an-lee/mixin_bot'

# WebSocket
gem 'faye-websocket'

# admin
gem 'tabler-rubygem'
gem 'active_link_to'

# View
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jb'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jquery-rails'
gem 'bootstrap', '~> 4.1.0'
gem 'simple_form', '~> 4.0.0'
gem "bootstrap_form", ">= 4.0.0.alpha1"
gem 'font-awesome-sass'
gem 'slim-rails'
gem 'high_voltage', '~> 3.0.0'
gem 'status-page'
gem 'browser_warrior', '>= 0.8.0'
gem 'redis-namespace'
gem 'sidekiq'
gem 'kaminari', '~> 1.1.1'
gem 'rails-i18n', '~> 5.0.3'
gem 'breadcrumbs_on_rails'

# Misc
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# deploy
gem 'mina', '~> 1.2.2', require: false
gem 'mina-puma', '~> 1.1.0', require: false
gem 'mina-multistage', '~> 1.0.3', require: false
gem 'mina-sidekiq', '~> 1.0.3', require: false
gem 'mina-logs', '~> 1.1.0', require: false

# HTTP client
gem 'http'
gem 'rest-client'

group :development do
  gem 'annotate', github: '80percent/annotate_models', branch: 'develop', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-sidekiq'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
end