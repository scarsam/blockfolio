# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
response = ExternalCryptoApi.call
response.each do |coin|
  Coin.create(
    name: coin["name"],
    symbol: coin["symbol"],
    price_usd: coin["price_usd"],
    market_cap_usd: coin["market_cap_usd"],
    percent_change_24h: coin["percent_change_24h"]
  )
end