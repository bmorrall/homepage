class WelcomeController < ApplicationController

  def index
    cache_response_for 1.minute
  end
end
