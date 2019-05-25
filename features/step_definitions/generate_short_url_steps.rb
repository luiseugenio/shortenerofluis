Given("I am o new_short_url page") do
  visit "/short_urls/new"
end

Given("I fill in url with {string}") do |string|
  within('form') do
    fill_in 'Url', with: string
  end
end

When("I click 'Shorten URL' button") do
  click_button "commit"
end

Then("{string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end
