require "spec_helper"

describe WelcomeController do
  describe "routing" do

    it "routes to #show" do
      get("/").should route_to("high_voltage/pages#show", id: 'home')
      get("/home").should route_to("high_voltage/pages#show", id: 'home')
    end

  end
end
