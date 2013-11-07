source 'https://rubygems.org'
ruby '1.9.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'pg'
gem 'thin'

gem 'carrierwave-aws'
gem 'carrierwave'
gem 'rmagick', require: 'RMagick'

gem 'haml-rails'

gem 'rails_admin'
gem 'devise', github: 'plataformatec/devise' # required by rails_admin
gem 'rolify'
gem 'simple_form'
gem 'inherited_resources'

#pdf
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'

# exceptions catch
gem 'party_foul'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

#gem 'font-awesome-rails'
#gem 'handlebars_assets', github: 'leshill/handlebars_assets'
gem 'zurb-foundation'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem "quiet_assets"
#  gem "better_errors"
#  gem 'binding_of_caller'
  gem 'sextant'
  gem 'debugger'
#  gem 'rails-dev-tweaks'
#  gem 'capistrano' # deploy
#  gem 'rvm-capistrano' # deploy
end

# only need if on heroku
group :production do
  gem 'rails_12factor'
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]
