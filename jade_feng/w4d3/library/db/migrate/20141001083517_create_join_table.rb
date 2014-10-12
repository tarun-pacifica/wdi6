class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :author, :book do |t|
      t.index :author_id
      t.index :book_id
    end
  end
end
