source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  # gem 'quiet_assets'  # hide logs of assets
  gem 'factory_girl_rails'
  gem "capybara"
  gem 'faker' # https://github.com/stympy/faker
  gem 'annotate'#, '~> 2.6.6'
  gem 'guard-rspec'
  gem "database_cleaner"
end

gem 'listen', '~> 3.0.5' # this gem must not be in the :development group

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'yandex-translator'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gem 'haml'
gem "haml-rails"
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap-datepicker-rails'


gem 'devise'
gem 'cancancan'
gem 'devise_invitable'        # https://github.com/scambra/devise_invitable
gem 'rails-i18n', '~> 5.0.0' # For 5.0.x
gem 'font-awesome-rails'
gem 'figaro' # https://github.com/laserlemon/figaro


# gem 'activerecord-nulldb-adapter', group: :production
gem 'activerecord-nulldb-adapter', github: 'mnoack/nulldb', ref: 'aa36e3c', group: :production # hotfix for https://github.com/nulldb/nulldb/issues/69

