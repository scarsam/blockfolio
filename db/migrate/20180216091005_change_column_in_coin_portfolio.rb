class ChangeColumnInCoinPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :coin_portfolios, :total_value, :decimal
  end
end
