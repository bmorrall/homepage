When /^(?:|I )click on the pig$/ do
  find('#spiderpig img').click
end

Then /^(?:|I )should see the Raptor$/ do
  if page.respond_to? :should
    page.should have_selector('#elRaptor')
  else
    assert page.has_selector?('#elRaptor')
  end
end

Then /^(?:|I )should hear the Raptor$/ do
  if page.respond_to? :should
    page.should have_selector('audio#elRaptorShriek', :visible => false)
  else
    assert page.has_selector?('audio#elRaptorShriek', :visible => false)
  end
end

