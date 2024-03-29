# You can read about this gist at: http://wealsodocookies.com/posts/how-to-test-facebook-login-using-devise-omniauth-rspec-and-capybara
# http://www.wealsodocookies.com/posts/how-to-test-facebook-login-using-devise-omniauth-rspec-and-capybara

def set_omniauth(opts = {})
  default = {
    provider: :facebook,
    uuid: "1234",
    facebook: {
      email: "foobar@example.com",
      gender: "Male",
      first_name: "foo",
      last_name: "bar"
    }
  }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[provider] = Hashie::Mash.new({
    "uid" => credentials[:uuid],
    "provider" => provider,
    "info" => {
      "email" => user_hash[:email],
      "first_name" => user_hash[:first_name],
      "last_name" => user_hash[:last_name],
      "name" => [user_hash[:first_name], user_hash[:last_name]].join(" "),
      "gender" => user_hash[:gender]
    }
  })
end

def set_invalid_omniauth(opts = {})
  credentials = {
    provider: :facebook,
    invalid: :invalid_crendentials
  }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]
end
