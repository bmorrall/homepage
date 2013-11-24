require 'spec_helper'
 
describe Users::OmniauthCallbacksController do

  describe "#annonymous user" do
    context "when facebook email doesn't exist in the system" do
      before(:each) do
        stub_env_for_omniauth
        get :facebook
        @user = User.where(:email => "foobar@example.com").first
      end
 
      it { @user.should_not be_nil }
 
      it "should create authentication with facebook id" do
        authentication = @user.user_accounts.where(:provider => "facebook", :uid => "1234").first
        authentication.should_not be_nil
      end
 
      it { should be_user_signed_in }
      it { response.should redirect_to root_url }
    end

    context "when facebook email already exist in the system" do
      before(:each) do
        stub_env_for_omniauth
        
        FactoryGirl.create(:user, :email => "foobar@example.com")
        get :facebook
      end
      
      it { flash[:notice].should == "Your email foobar@example.com is already in the system. You need to sign in first."}      
      it { response.should redirect_to root_url }
    end
  end
  
  describe "#logged in user" do
    context "when user don't have facebook authentication" do
      before(:each) do
        stub_env_for_omniauth

        user = FactoryGirl.create(:user, :email => "existing@example.com", :password => "my_secret")
        sign_in user
 
        get :facebook
      end
 
      it "should add facebook authentication to current user" do
        user = User.where(:email => "existing@example.com").first
        user.should_not be_nil
        fb_authentication = user.user_accounts.where(:provider => "facebook").first
        fb_authentication.should_not be_nil
        fb_authentication.uid.should == "1234"
      end
 
      it { should be_user_signed_in }
      it { response.should redirect_to root_url }
      it { flash[:notice].should == "Successfully authenticated from Facebook account."}
    end
    
    context "when user already connected with facebook" do
      before(:each) do
        stub_env_for_omniauth
        
        user = FactoryGirl.create(:user, :email => "foobar@example.com")
        FactoryGirl.create(:user_account, :provider => "facebook", :uid => "1234", :user => user)
        sign_in user
 
        get :facebook
      end
      
      it "should not add new facebook authentication" do
        user = User.where(:email => "foobar@example.com").first
        user.should_not be_nil
        fb_authentications = user.user_accounts.where(:provider => "facebook")
        fb_authentications.count.should == 1
      end

      it { should be_user_signed_in }
      it { flash[:notice].should == "Successfully authenticated from Facebook account." }
      it { response.should redirect_to root_url }
    end
  end
  
end
 
def stub_env_for_omniauth(options = {})
  # This a Devise specific thing for functional tests. See https://github.com/plataformatec/devise/issues/closed#issue/608
  request.env["devise.mapping"] = Devise.mappings[:user]
  OmniAuth.config.test_mode = true
  request.env["omniauth.auth"] = set_omniauth(options)
end
