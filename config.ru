require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require 'sass/plugin/rack'

use Sass::Plugin::Rack
use Rack::MethodOverride
use MoviesController
use UsersController
use ReviewsController
use SessionsController
run ApplicationController
