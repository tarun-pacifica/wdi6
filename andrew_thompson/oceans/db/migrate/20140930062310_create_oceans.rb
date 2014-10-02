class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
    	t.string :name
    	t.text :image
    	t.float :volume
    	t.float :area
    	t.float :depth
    	t.string :bounded_by
    	t.timestamps
    end
  end
end
