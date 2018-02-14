class ChangeDecimalInCoinsBigIntPercentage < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :percentage_change_24h, :integer, limit: 8
  end
end
