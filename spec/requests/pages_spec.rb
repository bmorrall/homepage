require "rails_helper"

RSpec.describe "Pages" do
  describe "GET /" do
    context "as a visitor" do
      it "renders the welcome page" do
        get root_url

        expect(response).to be_successful
      end

      it "renders the wonderpig" do
        get root_url

        expect(response.body).to have_selector("body.welcome #spiderpig-container")
      end

      it "provides the raptors" do
        get root_url

        expect(response.body).to have_selector("[data-image-source]")
        expect(response.body).to have_selector("[data-audio-sources]")
        expect(response.body).to have_selector("[data-swarm-audio-sources]")
      end

      it "renders the Google Analytics content" do
        get root_url

        expect(response.body).to include("Analytics.push(['_setAccount', 'UA-12345678-A'])")
      end
    end
  end

  describe "GET /home" do
    context "as a visitor" do
      it "redirects to the root_url" do
        get "/home"

        expect(response).to redirect_to(root_url)
      end
    end
  end
end
