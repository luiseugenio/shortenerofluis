Given("I am on the {string} page") do |string|
  visit "#{string}"
end

Then("I should see {string}") do |string|
  page.has_content?(string)
end
