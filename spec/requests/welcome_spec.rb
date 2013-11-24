require 'spec_helper'

describe "Welcome" do

  describe "GET /" do
    context "as a visitor" do
      it "renders the welcome page" do
        get root_url
        response.status.should be(200)
      end
    end
  end

end