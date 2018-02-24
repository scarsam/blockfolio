module ApplicationHelper

  def show_errors(object, field_name)
    if object.errors.any?
      object.errors.messages[field_name].last
    end
  end

  def find_coin_portfolio(coin, portfolio)
    CoinPortfolio.find_by(coin_id: coin.id, portfolio_id: portfolio.id)
  end

end
