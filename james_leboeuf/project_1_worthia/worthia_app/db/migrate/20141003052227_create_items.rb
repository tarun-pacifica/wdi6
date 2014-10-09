class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.text :image, :default => 'http://w3.fnstatic.co.uk/sites/all/themes/foodnetwork/images/layout/recipes/default.jpg'
      t.integer :user_id
      t.string :address
      t.string :country
      t.string :country_code
      t.timestamps
    end
  end
end
