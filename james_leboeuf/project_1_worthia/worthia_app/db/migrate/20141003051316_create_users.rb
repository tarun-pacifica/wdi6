class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :image, :default => 'http://www.ihd-wallpapers.com/wp-content/uploads/2014/08/American_flags_hd_wallpapers_6.jpg'
      t.string :password_digest
      t.timestamps
    end
  end
end
