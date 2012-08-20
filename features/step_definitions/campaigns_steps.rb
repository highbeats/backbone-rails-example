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

And /^I am on the new campaign page$/ do
  step %{I go to campaigns index}
  find("a:contains('New Campaign')").click
end

When /^I submit new campaign form with valid data$/ do
  within("form") do
    find("select#brand_id").select("Dell")
    find("#start_from_date") {|date| fill_in(date, :with => "29/08/2012")}
    find("#end_date") {|date| fill_in(date, :with =>"29/09/2012")}
    find("#save_campaign").click
  end
end

Then /^I should see campaigns list$/ do
  step %{I go to campaigns index}
end
