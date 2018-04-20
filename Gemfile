source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.0'

### Database 
gem 'pg', '>= 0.18', '< 2.0'
# gem 'redis', '~> 4.0'

### Server
gem 'puma', '~> 3.11'

### Assets Pipeline
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap', '~> 4.1.0'

### JS
gem 'coffee-rails', '~> 4.2'
# gem 'mini_racer', platforms: :ruby
gem 'turbolinks', '~> 5'

### Templates
gem 'jbuilder', '~> 2.5'
gem 'slim'

### Background processing...
gem 'sidekiq', '>= 4.1.4'

### Documentation
gem 'annotate', group: :development

gem 'bootsnap', '>= 1.1.0', require: false
gem 'rest-client'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'

  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
