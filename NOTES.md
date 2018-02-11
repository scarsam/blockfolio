Rails Project - CryptoPortfolio
Idea
Similar to stock portfolio sites, this would be a site to create different portfolios with cryptocurrencies. A user should be able to create multiple portfolios containing different coins. Also view other users portfolios if the admin make their portfolio public. A user should be able to edit the name of their portfolio and also edit which coins they want to have in their portfolios. The index page will rank the most successful portfolios and their profiles.

Views

- Root
  - Value props and sign up form / login link
- Nav
  - Show top portfolio
  - See my own portfolios
  - Logout
- Index
  - List of your portfolios
    - Total value
    - Percentage change
  - If no portfolios is added show add portfolio link
- Show (portfolio)
  - See all coins
  - See value for each coin
  - See total value
- Show (user)
  - Display all users portfolios

Authentication / Authorization 

  - Devise
  - Omniauth (Facebook or Google)
  - CanCan (Permissions for viewing portfolios, edit portfolio)

Models

  - User
    - has_many coins, through portfolio
  - Coin
    - has_many portfolios, through coins_portfolio
  - Portfolio
    - belongs_to user
    - has_many coins through coins_portfolio
  - Portfolio_coins
    - belongs_to coins
    - belongs_to portfolios

     "id": "ethereum",
        "name": "Ethereum",
        "symbol": "ETH",
        "rank": "2",
        "price_usd": "12.1844",
        "price_btc": "0.021262",
        "24h_volume_usd": "24085900.0",
        "market_cap_usd": "1018098455.0",
        "available_supply": "83557537.0",
        "total_supply": "83557537.0",
        "percent_change_1h": "-0.58",
        "percent_change_24h": "6.34",
        "percent_change_7d": "8.59",
        "last_updated": "1472762062"

Tables

  - User
    - string :email
    - string :password
  - Coin
    - string :name
    - decimal :price_usd
    - decimal :market_cap_usd
    - decimal :percentage_change_24h
    - integer :quantity
  - Portfolio
    - string :email
    - decimal :value
  - Portfolio_coins
    - integer :quantity
    - decimal :percentage_change_24h

Forms

  - Nested form for creating portfolio and coin at the same time, assigning it the current user
  - portfolio[coins_attribute][0][name]

Validation

  - User must have valid email and password
  - Portfolio must have coin and a user

Nested resources

  - User/1/portfolios
  - User/1/portfolios/new
    

API

  - Fetch the data from https://coinmarketcap.com/api/
  - Callback to on validation for update coins?
  - https://learn.co/tracks/full-stack-web-development-v3/rails/associations-and-rails/activerecord-lifecycle-methods

Heroku

  - Host app on Heroku

Test

  - Capybara feature tests
  - https://learn.co/tracks/full-stack-web-development-v3/rails/validations-and-forms/rails-testing

Other ideas
Give the user a sign up starting amount (10k) per portfolio and see which one that is performing the best.


Form
Portfolio form

- name
- select Coins
  - display coin attributes
    - price usd
    - current market cap usd
    - percentage changed 24h
  - quantity
- submit

Ideas:
- Portfolio form
  - creates Portfolio and associates selected coins
  - redirects after create to the join_table attribute form
  - edit/update form for portfolio with fields for join_table?
  or
  - creates Portfolio and associates selected coins
  - input quantity somehow?
  - user after_save macro to update join_table attribute
  - redirect to portfolio show page
  Issues with current solution
  - breaks the edit/update form if I decide to use "second" form through update action
  - can I change controller/action and let the update action be untouched?
  
  
  Render x fields for portfolio (create)
  x amount of fields - skip double form
  Dataset tag
  Show page - add new coin / change quantity
  portfolio/1/coins/new
  
  find_or_create action
  coin_portfolios_controller instead