class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :image, :default => 'http://facebookcraze.com/wp-content/uploads/2010/10/alternative-facebook-profile-picture-superman-funny-joke.jpg'
      t.string :password_digest
      t.timestamps
    end
  end
end
