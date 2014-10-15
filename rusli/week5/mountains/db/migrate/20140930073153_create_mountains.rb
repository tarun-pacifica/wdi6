class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
    	t.string :mountain
    	t.float	:feet
    	t.text :country
    	t.text :type
    	t.integer :eruption
    end
  end
end
