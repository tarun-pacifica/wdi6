class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
    	t.string :name
    	t.string :image
    	t.string :continent
    	t.float :size
    	t.float :volume
    	t.timestamp
    end
  end
end
