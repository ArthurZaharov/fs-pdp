source "https://rubygems.org"

ruby "2.2.4"

gem "rails", "6.1.7.4"
gem "pg"

# assets
gem "autoprefixer-rails"
gem "coffee-rails", ">= 4.2.2"
gem "foundation-icons-sass-rails"
gem "foundation-rails", "~> 5.5.3.1"
gem "jquery-rails", ">= 4.1.1"
gem "sass-rails", "~> 5.0.8"
gem "skim", git: "https://github.com/jfirebaugh/skim"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 2.7.2"

# views
gem "active_link_to", ">= 1.0.4"
gem "country_select"
gem "metamagic"
gem "simple_form", ">= 4.0.0"
gem "slim"

# all other gems
gem "decent_decoration"
gem "decent_exposure"
gem "devise", ">= 4.7.0"
gem "draper", ">= 3.1.0"
gem "flamegraph"
gem "geocoder"
gem "google-analytics-rails"
gem "health_check", ">= 1.7.2"
gem "interactor"
gem "kaminari", ">= 0.17.0"
gem "local_time", ">= 2.0.0"
gem "memory_profiler"
gem "pg_search"
gem "puma"
gem "pundit"
gem "rack-canonical-host"
gem "rack-mini-profiler", require: false
gem "responders", ">= 3.0.0"
gem "rollbar"
gem "seedbank"
gem "stackprof"
gem "stripe-rails", ">= 0.4.0"

group :staging, :production do
  gem "dalli"
  gem "newrelic_rpm"
  gem "rails_stdout_logging"
end

group :test do
  gem "capybara"
  gem "capybara-webkit"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "vcr"
  gem "webmock"
end

group :development, :test do
  gem "awesome_print"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "byebug"
  gem "coffeelint"
  gem "dotenv-rails", ">= 2.7.6"
  gem "factory_girl_rails", ">= 4.7.0"
  gem "faker"
  gem "fuubar", "~> 2.0.0.rc1"
  gem "jasmine", "> 2.0"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rails_best_practices", require: false
  gem "rspec-rails", "~> 3.5", ">= 3.5.0"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", require: false
  gem "slim_lint", require: false
end

group :development do
  gem "bullet"
  gem "foreman", require: false
  gem "letter_opener"
  gem "quiet_assets"
  gem "rails-erd"
  gem "slim-rails", ">= 3.1.0"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console", "~> 3.0", ">= 3.0.0"
end
