
When /^(?:|I )click on the Pig$/ do
  find('#spiderpig img').click
end

Then /^(?:|I )should see the Pig$/ do
  page.should have_selector('#spiderpig img')
end

Then /^(?:|I )should see and hear the Raptor$/ do
  page.should have_selector('.raptor')
  page.should have_selector('audio', :visible => false)
end
