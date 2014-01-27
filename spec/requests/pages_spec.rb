require 'spec_helper'

describe "Pages" do

  describe "GET /" do
    context "as a visitor" do
      it "renders the welcome page" do
        get root_url
        response.status.should be(200)
      end
      it 'renders the Google Analytics content' do
        Settings.analytics_account = 'UA-12345678'
        get root_url
        response.body.should include("Analytics.push(['_setAccount', 'UA-12345678'])")
      end
    end
  end

  describe "GET /home" do
    context 'as a visitor' do
      it 'redirects to the root_url' do
        get page_path('home')
        response.should redirect_to(root_url)
        follow_redirect!
        response.status.should be(200)
      end
    end
  end

end