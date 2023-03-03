require_relative "./config/environment"

use Rack::Cors do
    allow do
      origins '*' # allow requests from any domain, update with specific domains if needed
      resource '*', # allow requests to any resource path
        headers: :any,
        methods: [:get, :post, :put, :delete, :options] # allow specific HTTP methods
    end
  end

use UsersController
use LandsController
run ApplicationController