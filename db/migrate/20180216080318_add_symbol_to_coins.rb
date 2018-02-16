class AddSymbolToCoins < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :symbol, :string
  end
end
