class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :user_id
      t.text :image
      t.timestamps
    end
  end
end
