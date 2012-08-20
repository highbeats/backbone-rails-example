Given /^I am on the home page$/ do
  visit(root_path)
end

When /^I go to campaigns index$/ do
  visit(root_path)
  find("a:contains('Campaings')").click
end
