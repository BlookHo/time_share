source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby "2.3.8"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use postgresql as the database for Active Record
gem 'activerecord-reset-pk-sequence'
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
# gem 'rack-cors'

# GraphQL
gem 'graphiql-rails'
gem 'graphql'

group :test do
  gem 'faker', '~> 1.6.0'
  # https://github.com/codecov/example-ruby
  # gem 'codecov', :require => false, :group => :test

  # gem 'factory_girl', '4.4.0'
  # gem 'fuubar'
  # gem 'guard-rspec', '~> 4.6'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution
  # and get a debugger console
  gem 'pry'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'colorize'
  gem 'pry-byebug'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
end

group :development do
  gem "brakeman"

  # Errors fix and debug
  gem 'better_errors'
  gem 'binding_of_caller'

  # gem 'guard'
  # gem 'guard-shell'

  gem 'listen', '>= 3.0.5', '< 3.2'

  # Automatic Ruby code checking tool
  gem 'rubocop', '~> 0.71.0', require: false #~> 0.54.0
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false

  gem "pronto", "~> 0.10.0"
  gem "pronto-rubocop", require: false

  # Spring speeds up development by keeping your application
  # running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
