require 'spec_helper'

describe "Welcome" do

  describe "GET /" do
    context "as a visitor" do
      it "renders the welcome page" do
        get root_url
        response.status.should be(200)
      end
      it 'renders the Google Analytics content' do
        Settings.analytics_account = 'UA-12345678'
        get root_url
        response.body.should include("_gaq.push(['_setAccount', 'UA-12345678'])")
      end
    end
  end

end