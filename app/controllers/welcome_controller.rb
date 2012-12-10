class WelcomeController < ApplicationController
  after_filter :clear_session!

  def index
    render :layout => nil
  end
end
