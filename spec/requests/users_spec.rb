require 'spec_helper'

describe "Users" do

  describe "GET /users/me" do
    context "as a visitor" do
      it "redirects to the new session path" do
        get me_users_path
        response.should redirect_to(new_user_session_path)
      end
    end
    context "as a signed in user" do
      before(:each) { sign_in_user }
      it "renders the user show page" do
        get me_users_path
        response.status.should be(200)
      end
    end
  end

end