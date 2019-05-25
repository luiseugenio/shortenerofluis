# luiseugenio/shortenerofluis

## Description

An application developed in Ruby. It accomplishes URL shortening and redirection from shortened URLs. With shortest possible length.

## Requirements

This template currently works with:

* Ruby 2.6.0
* Rails 5.2.3
* Sidekiq
* PostgreSQL

## Usage

Project details

1. Strategy:
    1. Take the ID in the database of the URL and then convert it to either Base 36 [a-z0-9] (case insensitive) to generate shortened URL;
    2. I used ActiveJob to perform the title search in the background;
    3. I used gem Faker to populate the database for the Top 100 board;
    4. Performed Model, Request and Acceptance tests.
2. Repository: https://github.com/luiseugenio/shortenerofluis
3. Production server on Heroku:
    1. Host: https://vast-thicket-11159.herokuapp.com/
    2. Configuration File: Procfile

To execute in development mode:

```
rake db:create
rake db:migrate
rake db:seed
rspec spec
cucumber
rails s
```

To promote in production mode:

```
git push heroku master
```

* The database supported by this app is `postgresql`.

## What does it do?

The app will perform this actions:

1. Generate Short URLs
2. Un-Short Shortened URLs
3. Show TOP 100 most visit links

## What is included?

#### These gems are added

* Utilities
    * [sidekiq][] – Redis-based job queue implementation for Active Job
    * [faker][] – A library for generating fake data such as names, addresses, and phone numbers.
    * [bootstrap][] – Build responsive, mobile-first projects on the web with the world's most popular front-end component library
    * [mechanize][] – Mechanize is a ruby library that makes automated web interaction easy
* Testing
    * [capybara][] – Acceptance test framework for web applications
    * [database_cleaner][] – Strategies for cleaning databases in Ruby.
    * [cucumber-rails][] – Rails Generators for Cucumber with special support for Capybara and DatabaseCleaner
    * [factory_bot_rails][] – is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies
    * [shoulda-matchers][] – Simple one-liner tests for common Rails functionality

[sidekiq]:http://sidekiq.org
[faker]:https://github.com/stympy/faker
[bootstrap]:http://getbootstrap.com
[mechanize]:https://github.com/sparklemotion/mechanize
[capybara]:https://github.com/cucumber/cucumber-rails
[database_cleaner]:https://github.com/DatabaseCleaner/database_cleaner
[cucumber-rails]:https://github.com/cucumber/cucumber-rails
[factory_bot_rails]:https://github.com/thoughtbot/factory_bot_rails
[shoulda-matchers]:https://github.com/thoughtbot/shoulda-matchers