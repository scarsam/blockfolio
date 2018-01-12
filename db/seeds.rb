# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User 1
user1 = User.create(email: 'sam@ojling.com', password: 'test123')

user1.portfolios.create(name: 'BTC Portfolio')
user1.portfolios[0].coins.build(name: 'btc')

# User 2
user2 = User.create(email: 'nils@westgardh.com', password: 'test456')

user2.portfolios.create(name: 'XLM Portfolio')
user2.portfolios[0].coins.build(name: 'xlm')

user2.portfolios.create(name: 'XRP Portfolio')
user2.portfolios[1].coins.build(name: 'xrp')

# User 3
user3 = User.create(email: 'sam@harper.com', password: 'test789')

user3.portfolios.create(name: 'ETH Portfolio')
user3.portfolios[0].coins.build(name: 'xlm')

user3.portfolios.create(name: 'LTC Portfolio')
user3.portfolios[1].coins.build(name: 'ltc')

user3.portfolios.create(name: 'FUN Portfolio')
user3.portfolios[2].coins.build(name: 'fun')

# Coins
Coin.create(name: 'BTC')
Coin.create(name: 'XLM')
Coin.create(name: 'XRP')
Coin.create(name: 'FUN')
Coin.create(name: 'ETH')
Coin.create(name: 'LTC')