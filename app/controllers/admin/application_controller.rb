class Admin::ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  check_authorization # Ensure CanCan is used for Authorisation

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403", :status => 403, :layout => false, :formats => [:html]
  end
end
