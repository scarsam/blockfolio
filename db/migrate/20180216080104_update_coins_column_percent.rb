class UpdateCoinsColumnPercent < ActiveRecord::Migration[5.1]
  def change
    rename_column :coins, :percentage_change_24h, :percent_change_24h
  end
end
