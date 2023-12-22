require "rails_helper"

RSpec.describe "Rails::Health" do
  describe "GET /up" do
    it "responds with success" do
      get rails_health_check_path

      expect(response).to be_successful
    end
  end
end
