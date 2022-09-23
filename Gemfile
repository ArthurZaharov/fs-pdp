source "https://rubygems.org"

ruby "2.2.4"

gem "rails", "5.2.8.1"
gem "pg"

# assets
gem "autoprefixer-rails"
gem "coffee-rails", ">= 4.2.2"
gem "foundation-icons-sass-rails"
gem "foundation-rails", "~> 5.5.2.1"
gem "jquery-rails", ">= 4.4.0"
gem "sass-rails", "~> 5.0.5"
gem "skim", git: "https://github.com/jfirebaugh/skim"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 2.7.2"

# views
gem "active_link_to"
gem "country_select"
gem "metamagic"
gem "simple_form", ">= 5.0.0"
gem "slim"

# all other gems
gem "decent_decoration"
gem "decent_exposure"
gem "devise", ">= 4.7.1"
gem "draper"
gem "flamegraph"
gem "geocoder", ">= 1.6.1"
gem "google-analytics-rails"
gem "health_check"
gem "interactor"
gem "kaminari", ">= 1.2.1"
gem "local_time"
gem "memory_profiler"
gem "pg_search"
gem "puma", ">= 4.3.12"
gem "pundit"
gem "rack-canonical-host", ">= 0.2.1"
gem "rack-mini-profiler", ">= 0.10.1", require: false
gem "responders", ">= 2.4.0"
gem "rollbar"
gem "seedbank"
gem "stackprof"
gem "stripe-rails"

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
  gem "brakeman", ">= 3.3.0", require: false
  gem "bundler-audit", require: false
  gem "byebug"
  gem "coffeelint"
  gem "dotenv-rails", ">= 2.2.2"
  gem "factory_girl_rails"
  gem "faker"
  gem "fuubar", "~> 2.0.0.rc1"
  gem "jasmine", ">= 2.4.0"
  gem "jasmine-jquery-rails"
  gem "pry-rails"
  gem "rails_best_practices", require: false
  gem "rspec-rails", "~> 3.5", ">= 3.5.0"
  gem "rubocop", ">= 0.49.0", require: false
  gem "rubocop-rspec", require: false
  gem "scss_lint", ">= 0.51.0", require: false
  gem "slim_lint", ">= 0.10.0", require: false
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
  gem "web-console", "~> 2.3", ">= 2.3.0"
end
