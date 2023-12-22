class WelcomeController < ApplicationController
  # GET /cache_for
  def cache_for
    # Cache the response for 1 minute
    cache_response_for 1.minute

    render "pages/home"
  end

  # GET /cache_since
  def cache_since
    # Cache the response as of the start of the minute
    if content_changed_since? Time.zone.now.change(sec: 0, usec: 0)
      render "pages/home"
    end
  end

  # GET /cache_private
  def cache_private
    # Cache the response privately for 1 minute publically
    expires_in 1.minute, public: false

    render "pages/home"
  end
end
