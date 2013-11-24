require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/users/me").should route_to("users#me")
    end

  end
end
