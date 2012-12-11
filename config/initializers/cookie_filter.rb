require 'cookie_filter'

Benmorrall::Application.config.middleware.insert_before ::ActionDispatch::Cookies, ::CookieFilter
