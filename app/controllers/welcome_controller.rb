class WelcomeController < ApplicationController
  after_filter :add_cache, :only => [:combo]

  def index
    cache_response_for 1.minute
  end

  def no_cache
    render :action => :index
  end

  def modified
    last_modified = Time.now.utc.to_a
    last_modified[0] = 0
    last_modified[1] = last_modified[1] - (last_modified[1] % 10)
    last_modified = Time.utc(*last_modified)
    if stale?(:last_modified => last_modified, :public => true)
      render :action => :index
    end
  end

  def combo
    last_modified = Time.now.utc.to_a
    last_modified[0] = 0
    last_modified[1] = last_modified[1] - (last_modified[1] % 10)
    last_modified = Time.utc(*last_modified)
    if stale?(:last_modified => last_modified, :public => true)
#      cache_response_for 1.minute
      render :action => :index
    end
  end

  def add_cache
    cache_response_for 1.minute
  end

end
