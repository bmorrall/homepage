require "rails_helper"

RSpec.describe "Users::Sessions" do
  describe "GET /users/sign_in" do
    context "with a guest" do
      it "renders a log in with facebook link", :aggregate_failures do
        get new_user_session_path

        expect(response).to be_successful

        expect(response.body).to have_link(href: user_facebook_omniauth_authorize_path)
        expect(response.body).to have_selector("img[alt='Sign in with Facebook']")
      end
    end
  end
end
