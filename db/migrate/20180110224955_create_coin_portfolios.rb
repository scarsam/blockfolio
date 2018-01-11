class CreateCoinPortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :coin_portfolios do |t|
      t.integer :quantity
      t.decimal :percentage_change_24h, :precision => 5, :scale => 2
      t.integer :coin_id
      t.integer :portfolio_id
      t.timestamps
    end
  end
end
