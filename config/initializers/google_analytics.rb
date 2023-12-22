Rails.application.configure do
  config.analytics_account = ENV.fetch("ANALYTICS_ACCOUNT")
end
