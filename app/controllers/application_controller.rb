class ApplicationController < ActionController::Base
  # turn off csrf token 
  protect_from_forgery with: :null_session
end
