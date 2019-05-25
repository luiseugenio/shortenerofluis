Feature: Visit Pages
  In order to read the page
  As a user
  I want to see the request page of my app

	Scenario Outline: View '<page>' page
		Given I am on the '<page>' page
		Then I should see '<content>'

	  Examples:
	    | page     | content														|
	    | /        | Listing All Short Urls							|
	    | /top_100 | Top 100 Most Frequently Short Urls	|