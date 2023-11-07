source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.0.6.1'

# postgresql 9.2 can use pg >= 1.0, postgresql 9.1 need to use < 1.0
gem 'pg', '1.5.4'

gem 'puma'
gem 'rabl'
gem 'jbuilder'   # wihout it rabl will not work in rails >= 5
gem 'actionpack-xml_parser'
# gem 'bcrypt', '~> 3.1.7'

gem "nokogiri", ">= 1.15.4"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
