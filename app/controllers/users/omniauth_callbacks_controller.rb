class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      if @user.errors.has_key? :email
        flash[:notice] = "Your email foobar@example.com is already in the system. You need to sign in first."
      else
        flash[:notice] = "Unable to create User account."
      end
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to root_url
    end
  end

  # Causes 404 errors with catchall routing configs
  def passthru
    raise ActionController::RoutingError.new('Not Found')
  end

end
