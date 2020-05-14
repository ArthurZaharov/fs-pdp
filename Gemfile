source "https://rubygems.org"

ruby "2.2.4"

gem "rails", "5.0.0"
gem "pg"

# assets
gem "autoprefixer-rails"
gem "coffee-rails", ">= 4.1.1"
gem "foundation-icons-sass-rails", ">= 3.0.0"
gem "foundation-rails", "~> 5.5.2.1"
gem "jquery-rails", ">= 4.1.0"
gem "sass-rails", "~> 5.0.5"
gem "skim", git: "https://github.com/jfirebaugh/skim"
gem "therubyracer", platforms: :ruby
gem "uglifier", ">= 2.7.2"

# views
gem "active_link_to", ">= 1.0.3"
gem "country_select"
gem "metamagic", ">= 3.1.7"
gem "simple_form", ">= 3.2.1"
gem "slim"

# all other gems
gem "decent_decoration"
gem "decent_exposure"
gem "devise", ">= 4.0.0"
gem "draper", ">= 2.1.0"
gem "flamegraph"
gem "geocoder"
gem "google-analytics-rails"
gem "health_check", ">= 1.5.1"
gem "interactor"
gem "kaminari", ">= 0.16.3"
gem "local_time", ">= 1.0.3"
gem "memory_profiler"
gem "pg_search"
gem "puma"
gem "pundit"
gem "rack-canonical-host", ">= 0.2.1"
gem "rack-mini-profiler", ">= 0.9.8", require: false
gem "responders", ">= 2.1.1"
gem "rollbar"
gem "seedbank"
gem "stackprof"
gem "stripe-rails", ">= 0.3.1"

group :staging, :production do
  gem "dalli"
  gem "newrelic_rpm"
  gem "rails_stdout_logging"
end

group :test do
  gem "capybara", ">= 2.6.2"
  gem "capybara-webkit", ">= 1.8.0"
  gem "codeclimate-test-reporter", require: false
  gem "database_cleaner"
  gem "email_spec"
  gem "formulaic", ">= 0.3.0"
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
  gem "dotenv-rails", ">= 2.1.0"
  gem "factory_girl_rails", ">= 4.6.0"
  gem "faker"
  gem "fuubar", "~> 2.0.0.rc1"
  gem "jasmine", ">= 2.4.0"
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
  gem "quiet_assets", ">= 1.1.0"
  gem "rails-erd"
  gem "slim-rails", ">= 3.1.0"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console", "~> 2.3", ">= 2.3.0"
end
