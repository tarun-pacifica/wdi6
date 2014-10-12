class AddDuedateToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :duedate, :date
  end
end
