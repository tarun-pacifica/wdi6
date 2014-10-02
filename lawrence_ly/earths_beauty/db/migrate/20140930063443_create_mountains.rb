class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :country
      t.float :elevation
      t.text :image
      t.timestamps
    end
  end
end
