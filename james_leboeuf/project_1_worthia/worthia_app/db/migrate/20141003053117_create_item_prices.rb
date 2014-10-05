class CreateItemPrices < ActiveRecord::Migration
  def change
    create_table :item_prices do |t|
      t.integer :item_id
      t.integer :user_id
      t.float :price 
      t.string :country
      t.timestamps
    end
  end
end
