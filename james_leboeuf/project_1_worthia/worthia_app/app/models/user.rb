# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  image           :text             default("http://facebookcraze.com/wp-content/uploads/2010/10/alternative-facebook-profile-picture-superman-funny-joke.jpg")
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  
  has_many :prices, :dependent => :destroy
  has_many :items, :dependent => :destroy

  has_many :price_on_items, :through => :prices, :source => :item

  accepts_nested_attributes_for :items, allow_destroy: true

  validates :name, :presence => true, :uniqueness => true, :length => {:minimum => 2}
  validates :email, :presence => true, :uniqueness => true
end
