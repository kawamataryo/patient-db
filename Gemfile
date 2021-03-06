source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
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
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  # add test
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # errorをみやすく
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  #railsのcodeing規約確認
  gem 'rubocop', require: false
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


# -----------------------------------------------------------
# my setupgem
# -----------------------------------------------------------
#bootstrap関連
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'tether-rails'
gem 'bootstrap-popover-rails', '~> 0.1.0'
#fontawesome関連
gem 'font-awesome-rails'
#slimeの導入
gem 'slim-rails'
gem 'html2slim'
# rubyとjavascriptの連携のために
gem 'gon'
# vue読み込み
gem 'vuejs-rails'
# pagenateの実装
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
# jquery
gem 'jquery-rails'
# 認証
gem 'devise'
# font-awesome
gem "font-awesome-rails"
# chart
gem "chartkick"
# group
gem 'groupdate'
# 論理削除の追加
gem 'paranoia'
# autoprefixer追加
gem 'autoprefixer-rails'
#検索機能追加
gem 'ransack'
#定数管理
gem 'config'
# ダミーseeds
gem 'faker'
gem 'gimei'
gem "yoshida"
gem 'as-duration'
