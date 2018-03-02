# Blockfolio

This webapplication is a simple version of the iPhone application Blockfolio. Blockfolio lets you saves your created portfolios under your profile, fill your portfolio with your favorite coins and login each day to track the progress of your portfolio.

### System dependencies
  - Postgres to manage and store data
  - CanCanCan to manage the authentication
  - BCrypt to hash and salt sensitive data
  - Dotenv to store environment keys
  - Omniauth to authenticate third-party users
  - HTTParty to parse the API response
  - Bootstrap to style the page 

### Configuration
  Make sure to `bundle` and follow the database steps below in order to get the application up and running. To start your server enter `rails s` in your terminal after finishing reading through this readme.
  
### Database initialization and creation
  In order to run the application correctly you first need to seed the database with data from the API, run:
1. `rake db:migrate`
2. `rake db:seed`

### How to run the test suite
This rails application is using Rspec to test the models and Capybara for integrations test. To run the test in your terminal:
-  `rspec`
