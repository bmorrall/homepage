class CookieFilter
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)

    # use only one of the next two lines

    if headers['Cache-Control'] =~ /public/
      # this will remove ALL cookies from the response
      headers.delete 'Set-Cookie'
      # this will remove just your session cookie
      # Rack::Utils.delete_cookie_header!(headers, '_app-name_session')
    end

    [status, headers, body]
  end
end
