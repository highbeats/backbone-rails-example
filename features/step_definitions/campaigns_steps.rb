Given /^I am on the home page$/ do
  visit(root_path)
end

And /^I navigate to ([a-z]*) section$/ do |section|
  within("#navigation") { find("a:contains('#{section.camelize}')").click }
end

Then /^I should see the list of existing ([a-z]*)$/ do |model|
  page.should have_selector("ul", class: "c-list")
  find(".c-list").all("li").count.should == model.classify.constantize.all.size
end

Given /^no ([a-z]*)s exist$/ do |model|
  model.classify.constantize.all.each { |m| m.destroy }
end

Then /^no ([a-z]*)s should exist$/ do |model|
  model.classify.constantize.all.size.should == 0
end

And /^I delete ([a-z]*)$/ do |model|
  find(".c-list li[data-campaign_id='1']") do |box|
    within(box) { find(".delete-#{model}").click }
  end
end

Then /^I should see flash "([^"]+)"$/ do |notice|
  find("#flashes").should have_content(notice)
end

And /^I (?:am|go) (?:on|to) the new ([a-z]*) page$/ do |resource|
  visit("/##{resource.pluralize}/new")
end

When /^I submit new campaign form with valid data$/ do
  within("form") do
    find("select#brand_id").select("Dell")
    find("#start_from_date") {|date| fill_in(date, :with => "29/08/2012")}
    find("#end_date") {|date| fill_in(date, :with =>"29/09/2012")}

    find(".add-country").click
    find(".country-selector").select("Austria")
    find(".add-lang").click
    find(".language-selector").select("English")
    find("#save_campaign").click
  end
end

Then /^I should see campaigns list$/ do
  step %{I go to campaigns index}
end
