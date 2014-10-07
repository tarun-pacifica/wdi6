class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :content
      t.text :image
      t.string :address
      t.timestamps
    end
  end
end
