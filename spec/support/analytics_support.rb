module AnalyticsFeatureHelpers
  def expect_page_to_have_tracking_script
    # Check AJAX Generated Tracking Script
    expect(page).to have_selector('script[src="http://www.google-analytics.com/ga.js"]', visible: :hidden)

    # Check Tracking Script Account
    expect(page.evaluate_script("typeof(_gaq)")).to eq("object") # It's a array of object
    expect(page.evaluate_script("typeof(_gaq.length)")).to eq("undefined") # It's not an array

    # Check Analytics was set
    result = page.evaluate_script("Analytics.events[0]")
    expect(result[0]).to eq("_setAccount")
    expect(result[1]).to eq("UA-12345678-A")

    # Check Page View was added
    result = page.evaluate_script("Analytics.events[1]")
    expect(result[0]).to eq("_trackPageview")
  end

  def expect_tracking_event(event_category, event_name)
    result = page.evaluate_script("Analytics.events[Analytics.events.length - 1]")
    expect(result[0]).to eq("_trackEvent")
    expect(result[1]).to eq(event_category)
    expect(result[2]).to eq(event_name)
  end
end

RSpec.configure do |config|
  config.include AnalyticsFeatureHelpers, type: :feature
end
