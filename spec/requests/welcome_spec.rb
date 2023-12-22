require "rails_helper"

RSpec.describe "Welcome" do
  include ActiveSupport::Testing::TimeHelpers

  describe "GET /cache_for" do
    before { travel_to Time.zone.local(2023, 12, 23, 16, 29, 30) }

    it "sets the page expiry for one minute", :aggregate_failures do
      get cache_for_path

      expect(response).to be_successful

      expect(response.headers["Cache-Control"]).to eq "max-age=60, public"
      expect(response.headers["Expires"]).to eq "Sat, 23 Dec 2023 16:30:30 GMT"
      expect(response.headers).not_to have_key "Last-Modified"
      expect(response.headers).not_to have_key "Set-Cookie"
    end
  end

  describe "GET /cache_since" do
    before { travel_to Time.zone.local(2023, 12, 23, 16, 29, 30) }

    it "sets the last modified header to the start of the minute", :aggregate_failures do
      get cache_since_path

      expect(response).to have_http_status(:ok)

      expect(response.headers["Cache-Control"]).to eq "max-age=0, private, must-revalidate"
      expect(response.headers["Last-Modified"]).to eq "Sat, 23 Dec 2023 16:29:00 GMT"
      expect(response.headers).not_to have_key "Expires"
      expect(response.headers).not_to have_key "Set-Cookie"
    end

    it "responds to current If-Modified-Since requests", :aggregate_failures do
      get cache_since_path,
        headers: {"If-Modified-Since" => "Sat, 23 Dec 2023 16:29:00 GMT"}

      expect(response).to have_http_status(:not_modified)

      expect(response.body).to be_empty

      expect(response.headers["Cache-Control"]).to eq "max-age=0, private, must-revalidate"
      expect(response.headers["Last-Modified"]).to eq "Sat, 23 Dec 2023 16:29:00 GMT"
      expect(response.headers).not_to have_key "Expires"
      expect(response.headers).not_to have_key "Set-Cookie"
    end

    it "responds to expired If-Modified-Since requests", :aggregate_failures do
      get cache_since_path,
        headers: {"If-Modified-Since" => "Sat, 23 Dec 2023 16:20:00 GMT"}

      expect(response).to have_http_status(:ok)

      expect(response.headers["Cache-Control"]).to eq "max-age=0, private, must-revalidate"
      expect(response.headers["Last-Modified"]).to eq "Sat, 23 Dec 2023 16:29:00 GMT"
      expect(response.headers).not_to have_key "Expires"
      expect(response.headers).not_to have_key "Set-Cookie"
    end
  end

  describe "GET /cache_private" do
    before { travel_to Time.zone.local(2023, 12, 23, 16, 29, 30) }

    it "publically caches the page for a minute", :aggregate_failures do
      get cache_private_path

      expect(response).to be_successful

      expect(response.headers["Cache-Control"]).to eq "max-age=60, private"
      expect(response.headers).not_to have_key "Expires"
      expect(response.headers).not_to have_key "Last-Modified"
      expect(response.headers).not_to have_key "Set-Cookie"
    end
  end
end
