class ExternalCryptoApi
  include HTTParty

  def self.call
    HTTParty.get("https://api.coinmarketcap.com/v1/ticker/")
  end

  def self.fetch_matching(coins)
    response = ExternalCryptoApi.call
    coins.map do |coin|
      response.select do |api_coin|
        coin.name == api_coin["name"]
      end
    end
  end

  def self.update(coins)
    matching_coins = ExternalCryptoApi.fetch_matching(coins)
    matching_coins.flatten.each do |api_coin|
      coin = Coin.find_by(name: api_coin["name"])
      coin.update(
        name: api_coin["name"],
        symbol: api_coin["symbol"],
        price_usd: api_coin["price_usd"],
        market_cap_usd: api_coin["market_cap_usd"],
        percent_change_24h: api_coin["percent_change_24h"]
      )
    end
  end

end