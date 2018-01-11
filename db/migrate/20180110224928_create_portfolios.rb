class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.decimal :total_value, :precision => 10, :scale => 2
      t.integer :user_id
      t.timestamps
    end
  end
end
