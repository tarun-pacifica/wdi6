class CreateWonders < ActiveRecord::Migration
  def change
    create_table :wonders do |t|
    	t.string :name
        t.string :image
    	t.string :country
    	t.string :continent

    	t.timestamps
    end
  end
end
