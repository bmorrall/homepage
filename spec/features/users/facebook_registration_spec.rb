require "rails_helper"

RSpec.feature "Users Facebook Registration" do
  scenario "User signs in with a new profile", :js do
    set_omniauth provider: :facebook

    # WHEN I visit the login page
    visit new_user_session_path

    # AND I click on the Facebook button
    find("img[alt='Sign in with Facebook']").click

    # THEN I Should see my details
    expect(page).to have_content("foobar@example.com")
  end

  scenario "User signs in with an existing profile", :js do
    set_omniauth provider: :facebook, uuid: "1234"

    # GIVEN I already have a profile
    user_account = FactoryBot.create(:user_account, provider: "facebook", uid: "1234")

    # WHEN I visit the login page
    visit new_user_session_path

    # AND I click on the Facebook button
    find("img[alt='Sign in with Facebook']").click

    # THEN I Should see my details
    expect(page).to have_content(user_account.user.email)
  end

  scenario "User signs in with already linked profile", :js do
    set_omniauth provider: :facebook, facebook: {
      email: "foobar@example.com"
    }

    # GIVEN I already have a profile
    FactoryBot.create(:user, email: "foobar@example.com")

    # WHEN I visit the login page
    visit new_user_session_path

    # AND I click on the Facebook button
    find("img[alt='Sign in with Facebook']").click

    # THEN I Should see my details
    expect(page).to have_selector(".alert-danger", text: "Your email is already in the system. You need to sign in first.")
  end

  scenario "User signs in with invalid facebook credentials", :js do
    set_invalid_omniauth

    # WHEN I visit the login page
    visit new_user_session_path

    # AND I click on the Facebook button
    find("img[alt='Sign in with Facebook']").click

    # THEN I Should see my details
    expect(page).to have_selector(".alert-danger", text: "Could not authenticate you from Facebook because")
  end
end
