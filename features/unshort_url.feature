Feature: Un-Short URL
  In order I have to discover a short url
  As a user
  I want get a original URL from short url

  Scenario Outline: With a valid Short URL I get a original url
    Given I am on / page with shortened_url param with '<shortened_url>'
    Then I should redirect_to '<url>'
    And I should received a http_status moved_permanently

    Examples:
    | shortened_url | url 									   |
    | 1             | https://www.google.com   |
    | 2             | https://www.facebook.com |

	Scenario Outline: With a invalid Short URL I received an error
		Given I am on / page with shortened_url param with '<shortened_url>'
    Then I should received a http_status bad_request

    Examples:
    | shortened_url |
    | 3             |