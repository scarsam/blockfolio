class ChangeDecimalInCoinsBigIntMarketCap < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :market_cap_usd, :integer, limit: 8
  end
end
