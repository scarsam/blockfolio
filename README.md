# Blockfolio

This web application is my take on the famous iPhone application Blockfolio. This application lets you saves your created portfolios under your profile, add your coins to your portfolio and login each day to track the progress of your portfolio.

### System dependencies
  - Postgres to manage and store data
  - CanCanCan to manage the authentication
  - BCrypt to hash and salt sensitive data
  - Dotenv to store environment keys
  - Omniauth to authenticate third-party users
  - HTTParty to parse the API response
  - Bootstrap to style the page 

### Configuration
Change the current working directory to the location where you want the cloned directory to be made and then type:
```
git clone git@github.com:scarsam/blockfolio.git
```
Once you have cloned all the files type:
```
bundle install
```
to install all the project dependencies and follow the database steps below in order to get the application up and running. To start your server type `rails s` in your terminal but make sure you finish the database creation steps first.
  
### Database initialization and creation
In order to run the application correctly you first need to seed the database with data from the API, run:
```
rake db:create
rake db:migrate
rake db:seed
```

### How to run the test suite
This rails application is using Rspec to test the models and Capybara for integrations test. To run the test in your terminal type: 
```
rspec
```

### Contribute to Blockfolio
A contributor can be anyone! It could be you. Continue reading this section if
you wish to get involved and contribute back to the Blockfolio project.
- Ensure the bug was not already reported by searching on GitHub under Issues.
- If you're unable to find an open issue addressing the problem, open a new one. Be sure to include a title and clear description, as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring.

Thanks! :heart:
