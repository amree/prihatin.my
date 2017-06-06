source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "flutie"
gem "jbuilder", "~> 2.5"
gem "mysql2"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.1"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "tzinfo-data"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug"
  gem "capybara", "~> 2.13"
  gem "dotenv-rails"
  gem "selenium-webdriver"
end

group :development do
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
