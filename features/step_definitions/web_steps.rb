When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should see (.*) within (.*)$/ do |item, wrapper|
  within(wrapper) do
    if page.respond_to? :should
      page.should have_selector(item)
    else
      assert page.has_selector?(item)
    end
  end
end