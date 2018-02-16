class ChangeColumnInCoinsPrice < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :price_usd, :decimal
  end
end
