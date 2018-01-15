class UpdateCoinsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :coins, :quantity
  end
end
