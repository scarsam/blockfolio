class RemoveTotalValueOnJoinTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :coin_portfolios, :total_value
  end
end
