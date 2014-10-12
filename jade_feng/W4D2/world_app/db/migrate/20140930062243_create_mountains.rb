class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
    	t.string :name
    	t.text :image
    	t.float :elevation
    	t.text :country
    	t.text :continent
    	t.text :parent_range

    	t.timestamps
    end
  end
end


