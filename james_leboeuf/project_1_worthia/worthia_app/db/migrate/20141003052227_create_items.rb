class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.text :image
      t.string :address
      t.string :country
      t.string :country_code
      t.timestamps
    end
  end
end
