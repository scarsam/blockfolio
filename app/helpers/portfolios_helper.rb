module PortfoliosHelper

  def display_total_value(portfolio)
    value = 0
    portfolio.coin_portfolios.each do |coin_portfolio|
      value += coin_portfolio.value unless coin_portfolio.value.nil?
    end
    portfolio.update(total_value: value)
    value
  end

  def display_owner(portfolio, current_user)
    if portfolio.user == current_user
      portfolio.user.email + ' (You)'
    else
      portfolio.user.email
    end
  end

  def coins_count(portfolio)
    portfolio.coins.count
  end

end