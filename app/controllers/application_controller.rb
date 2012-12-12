class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  # check content has changed since last_updated
  def content_changed_since?(last_updated)
    stale?(:last_modified => last_updated)
  end

  # Adds a expiry header and stores in public cache for duration
  def cache_response_for(duration)
    # response.headers["Expires"] = CGI.rfc1123_date(Time.now + expiry)
    response.headers["Expires"] = duration_in_words(duration)
    expires_in duration, :public => true
  end

  def duration_in_words(duration)
    (Time.now + duration).strftime '%a, %d %b %Y %H:%M:%S GMT'
  end

end
