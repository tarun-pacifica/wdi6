class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :item_id
      t.integer :user_id
      t.integer :price
      t.timestamps
    end
  end
end
