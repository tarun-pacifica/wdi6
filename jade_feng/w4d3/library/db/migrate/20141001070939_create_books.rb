class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title
    	t.string :series
    	t.string :language
    	t.string :genre
    	t.integer :published
    	t.text :image
    	t.integer :author_id
    	t.timestamps
    end
  end
end
