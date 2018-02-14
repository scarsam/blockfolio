class ChangeDecimalInCoinsPercentageChange < ActiveRecord::Migration[5.1]
  def change
    change_column :coins, :percentage_change_24h, :integer
  end
end
