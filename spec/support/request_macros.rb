module RequestMacros
  def sign_in_user(user = nil)
    user ||= FactoryBot.create(:user)
    post user_session_path,
      params: {user: {email: user.email, password: user.password}}

    user
  end
end

RSpec.configure do |config|
  config.include RequestMacros, type: :request
end
