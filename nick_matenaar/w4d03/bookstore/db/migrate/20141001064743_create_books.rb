class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title
    	t.string :author 
    	t.string :publisher 
    	t.date :published_date
    	t.text :image
    	t.integer :author_id
    	
    	t.timestamps
    end
  end
end
