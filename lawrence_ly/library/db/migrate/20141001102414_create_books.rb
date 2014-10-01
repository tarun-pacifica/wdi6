class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.integer :pages
      t.string :genre
      t.text :image
      t.timestamps
    end
  end
end