class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => "admin", :password => Settings.password
end
