module PortfoliosHelper

  def total_value(portfolio)
    value = 0
    portfolio.coin_portfolios.each do |coin_portfolio|
      value += coin_portfolio.value unless coin_portfolio.value.nil?
    end
    portfolio.update(total_value: value)
    value
  end

  def display_owner(portfolio)
    portfolio.user.email
  end

  def owner?(portfolio)
    portfolio.user == current_user ? true : false
  end

  def coins_count(portfolio)
    portfolio.coins.count
  end

end