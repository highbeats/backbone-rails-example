When /^I submit new company form with valid data$/ do
  find("form") do |form|
    within(form) do
      find("#company_name") { |field| fill(field, :with => "TestName") }
      find("#company_address") { |field| fill(field, :with => "Piedras 623 Piso 2, depto 4 C1070AAM, Capital Federal") }
      find("#company_phone") { |field| fill(field, :with => "12345678") }
      find("#save_company").click
    end
  end
end
