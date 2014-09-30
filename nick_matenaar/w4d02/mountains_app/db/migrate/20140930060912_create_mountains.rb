class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
    	t.string :name
    	t.float :height 
    	t.text :image

    	t.timestamps
    end
  end
end
