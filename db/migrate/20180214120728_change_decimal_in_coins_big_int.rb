class ChangeDecimalInCoinsBigInt < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :price_usd, :integer, limit: 8
  end
end
