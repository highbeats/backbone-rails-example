Given /^I am on the home page$/ do
  visit(root_path)
end

When /^I go to campaigns index$/ do
  visit(root_path)
  find("a:contains('Campaings')").click
end

Then /^I should see the list of all campaigns$/ do
  page.should have_selector("ul", class: "c-list")
  find(".c-list").all("li").count.should == 2
end
