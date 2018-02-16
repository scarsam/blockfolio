class ChangeColumnInCoins < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :percent_change_24h, :decimal
  end
end
