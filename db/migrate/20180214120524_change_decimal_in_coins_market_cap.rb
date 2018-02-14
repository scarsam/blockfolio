class ChangeDecimalInCoinsMarketCap < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :market_cap_usd, :integer
  end
end
