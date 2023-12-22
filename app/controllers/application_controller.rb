class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # after_action :verify_authorized, unless: :devise_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery

  protected

  # Redirect to self profile after sign in
  def after_sign_in_path_for(resource)
    me_users_path
  end

  # check content has changed since last_updated
  def content_changed_since?(last_updated)
    stale?(last_modified: last_updated)
  end

  # Adds a expiry header and stores in public cache for duration
  def cache_response_for(duration)
    # response.headers["Expires"] = CGI.rfc1123_date(Time.now + expiry)
    response.headers["Expires"] = cache_duration_in_words(duration)
    expires_in duration, public: true
  end

  def cache_duration_in_words(duration)
    (Time.now + duration).strftime "%a, %d %b %Y %H:%M:%S GMT"
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: me_users_path)
  end
end
