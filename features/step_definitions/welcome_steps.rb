When /^(?:|I )click on the Pig$/ do
  find('#spiderpig img').click
end

Then /^(?:|I )should see the Pig$/ do
  page.should have_selector('#spiderpig img')
end

Then /^(?:|I )should see and hear the Raptor$/ do
  if page.respond_to? :should
    page.should have_selector('#elRaptor')
    page.should have_selector('audio#elRaptorShriek', :visible => false)
  else
    assert page.has_selector?('#elRaptor')
    assert page.has_selector?('audio#elRaptorShriek', :visible => false)
  end
end
