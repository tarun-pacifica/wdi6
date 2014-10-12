class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.date :dob
    	t.string :email
    end
  end
end
