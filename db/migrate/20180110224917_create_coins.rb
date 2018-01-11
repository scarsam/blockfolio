class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :name
      t.decimal :price_usd, :precision => 6, :scale => 3
      t.decimal :market_cap_usd, :precision => 11, :scale => 1
      t.decimal :percentage_change_24h, :precision => 5, :scale => 2
      t.integer :quantity
      t.timestamps
    end
  end
end
