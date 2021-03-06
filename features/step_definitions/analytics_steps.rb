Given /^(?:|I )have a Google Analytics tracker$/ do
  Settings.analytics_account = 'UA-12345678-A'
end

Then /^(?:|I )should have a tracking script$/ do
  # Check AJAX Generated Tracking Script
  page.should have_selector(:xpath, './/script[@src="http://www.google-analytics.com/ga.js"]', visible: false)

  # Check Tracking Script Account
  page.evaluate_script('typeof(_gaq)').should eq('object') # It's a array of object
  page.evaluate_script('typeof(_gaq.length)').should eq('undefined') # It's not an array

  # Check Analytics was set
  result = page.evaluate_script('Analytics.events[0]')
  result[0].should eq('_setAccount')
  result[1].should eq('UA-12345678-A')

  # Check Page View was added
  result = page.evaluate_script('Analytics.events[1]')
  result[0].should eq('_trackPageview')
end

Then /^(?:|I )should fire a (.+):(.+) tracking event$/ do |event_category, event_name|
  result = page.evaluate_script('Analytics.events[Analytics.events.length - 1]')
  result[0].should eq('_trackEvent')
  result[1].should eq(event_category)
  result[2].should eq(event_name)
end 