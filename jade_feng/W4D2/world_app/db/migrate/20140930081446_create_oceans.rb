class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
    	t.string :name
    	t.text :image
    	t.float :depth
    	t.float :area
    	t.float :volume
    	t.float :coastline

    	t.timestamps
    end
  end
end
