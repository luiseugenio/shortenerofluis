Feature: Generate Short URL
  In order I have character limitations
  As a user
  I want get a shortened URL

  Scenario Outline: With a valid URL I get a short url
    Given I am o new_short_url page
    And I fill in url with '<url>'
    When I click 'Shorten URL' button
    Then I should see "Short url was successfully created."

    Examples:
    | url 									 |
    | https://www.google.com |

	Scenario Outline: With a blank URL I get an error
		Given I am o new_short_url page
    And I fill in url with '<url>'
    When I click 'Shorten URL' button
    Then I should see "can't be blank"
    And "is not a valid HTTP URL"

    Examples:
    | url 										 |

  Scenario Outline: With a invalid URL I get an error
		Given I am o new_short_url page
    And I fill in url with '<url>'
    When I click 'Shorten URL' button
    Then I should see "is not a valid HTTP URL"

    Examples:
    | url 									 |
    | http://www.						 |

  