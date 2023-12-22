require "rails_helper"

RSpec.describe "Users" do
  describe "GET /users/me" do
    context "as a visitor" do
      it "redirects to the new session path" do
        get me_users_path

        expect(response).to redirect_to(new_user_session_path)

        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    context "as a signed in user" do
      let!(:current_user) { sign_in_user }

      it "renders the user show page", :aggregate_failures do
        get me_users_path

        expect(response).to be_successful

        expect(response.body).to have_content(current_user.name)
        expect(response.body).to have_content(current_user.email)
      end
    end
  end

  describe "GET /users/:id" do
    context "as a visitor" do
      it "redirects to the new session path" do
        get user_path(1)

        expect(response).to redirect_to(new_user_session_path)

        expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
      end
    end

    context "as a signed in user" do
      let!(:current_user) { sign_in_user }

      it "renders the user show page for themselves", :aggregate_failures do
        get user_path(current_user)

        expect(response).to be_successful

        expect(response.body).to have_content(current_user.name)
        expect(response.body).to have_content(current_user.email)
      end

      it "does not render the show page for other users", :aggregate_failures do
        other_user = FactoryBot.create(:user)

        get user_path(other_user)

        expect(response).to redirect_to me_users_path

        expect(flash[:alert]).to eq "You are not authorized to perform this action."
      end
    end
  end
end
