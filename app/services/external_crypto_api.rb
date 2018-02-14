class ExternalCryptoApi
  include HTTParty

  def self.call
    HTTParty.get("https://api.coinmarketcap.com/v1/ticker/")
  end

  def self.update(coins)
    binding.pry
    response = ExternalCryptoApi.call
    response.each do |api_data|
      coins.flatten.each do |coin|
        coin.update(
          name: api_data["name"],
          price_usd: api_data["price_usd"],
          market_cap_usd: api_data["market_cap_usd"],
          percentage_change_24h: api_data["percentage_change_24"]
        )
      end
    end
  end

end