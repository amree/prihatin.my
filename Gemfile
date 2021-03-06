source "https://rubygems.org"
ruby "2.4.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "autoprefixer-rails"
gem "devise"
gem "billplz-api"
gem "daemons"
gem "delayed_job_active_record"
gem "flutie"
gem "high_voltage"
gem "jbuilder", "~> 2.5"
gem "mina"
gem "mina-delayed_job", require: false
gem "mysql2"
gem "omniauth-facebook"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.3"
gem "sassc-rails"
gem "sass-rails", "~> 5.0"
gem "sentry-raven"
gem "simple_form"
gem "skylight"
gem "tzinfo-data"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug"
  gem "factory_girl_rails"
  gem "capybara", "~> 2.14"
  gem "dotenv-rails"
  gem "rspec-rails", "~> 3.6"
  gem "selenium-webdriver"
end

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "launchy"
  gem "shoulda-matchers"
  gem "timecop"
end
