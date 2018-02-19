class AddColumnToCoinsPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_column :coin_portfolios, :value, :decimal
  end
end
