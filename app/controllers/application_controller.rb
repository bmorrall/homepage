class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  # Removes Session Cookies
  def clear_session!
    session.clear
  end

end
