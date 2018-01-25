# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Coins
btc_coin = Coin.create(name: 'BTC')
xlm_coin = Coin.create(name: 'XLM')
xrp_coin = Coin.create(name: 'XRP')
fun_coin = Coin.create(name: 'FUN')
eth_coin = Coin.create(name: 'ETH')
ltc_coin = Coin.create(name: 'LTC')

# User 1
user1 = User.create(email: 'sam@ojling.com', password: 'test123')

user_1_portfolio_1 = user1.portfolios.create(name: 'BTC Portfolio')
CoinPortfolio.create(
  portfolio_id: user_1_portfolio_1.id,
  coin_id: btc_coin.id,
  quantity: 43
)

# User 2
user2 = User.create(email: 'nils@westgardh.com', password: 'test456')

user_2_portfolio_1 = user2.portfolios.create(name: 'XLM Portfolio')
CoinPortfolio.create(
  portfolio_id: user_2_portfolio_1.id,
  coin_id: xrp_coin.id,
  quantity: 1231
)

CoinPortfolio.create(
  portfolio_id: user_2_portfolio_1.id,
  coin_id: xlm_coin.id,
  quantity: 5423
)

user_2_portfolio_2 = user2.portfolios.create(name: 'XRP Portfolio')
CoinPortfolio.create(
  portfolio_id: user_2_portfolio_2.id,
  coin_id: xrp_coin.id,
  quantity: 13231
)

CoinPortfolio.create(
  portfolio_id: user_2_portfolio_2.id,
  coin_id: fun_coin.id,
  quantity: 52423
)

# User 3
user3 = User.create(email: 'sam@harper.com', password: 'test789')

user_3_portfolio_1 = user3.portfolios.create(name: 'ETH Portfolio')
CoinPortfolio.create(
  portfolio_id: user_3_portfolio_1.id,
  coin_id: eth_coin.id,
  quantity: 15
)

CoinPortfolio.create(
  portfolio_id: user_3_portfolio_1.id,
  coin_id: ltc_coin.id,
  quantity: 27
)

CoinPortfolio.create(
  portfolio_id: user_3_portfolio_1.id,
  coin_id: fun_coin.id,
  quantity: 2752
)

user_3_portfolio_2 = user3.portfolios.create(name: 'LTC Portfolio')
CoinPortfolio.create(
  portfolio_id: user_3_portfolio_2.id,
  coin_id: btc_coin.id,
  quantity: 5
)

CoinPortfolio.create(
  portfolio_id: user_3_portfolio_2.id,
  coin_id: ltc_coin.id,
  quantity: 35
)

CoinPortfolio.create(
  portfolio_id: user_3_portfolio_2.id,
  coin_id: xrp_coin.id,
  quantity: 27252
)

user_3_portfolio_3 = user3.portfolios.create(name: 'FUN Portfolio')
CoinPortfolio.create(
  portfolio_id: user_3_portfolio_3.id,
  coin_id: fun_coin.id,
  quantity: 12300
)

CoinPortfolio.create(
  portfolio_id: user_3_portfolio_3.id,
  coin_id: eth_coin.id,
  quantity: 10
)

CoinPortfolio.create(
  portfolio_id: user_3_portfolio_3.id,
  coin_id: xlm_coin.id,
  quantity: 15252
)