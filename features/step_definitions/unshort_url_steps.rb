Given("I am on \/ page with shortened_url param with {string}") do |string|
  visit "/#{string}"
end

Then("I should redirect_to {string}") do |string|
	visit string
end

Then("I should received a http_status moved_permanently") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I should received a http_status bad_request") do
  pending # Write code here that turns the phrase above into concrete actions
end
