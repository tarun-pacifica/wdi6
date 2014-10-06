# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  image           :text
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :prices
  has_many :items

  accepts_nested_attributes_for :items

  validates :name, :presence => true, :uniqueness => true, :length => {:minimum => 2}
  validates :email, :presence => true, :uniqueness => true
end
