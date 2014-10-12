# == Schema Information
#
# Table name: users
#
#  id      :integer          not null, primary key
#  name    :string(255)
#  dob     :date
#  email   :string(255)
#  image   :text
#  user_id :text
#

class User < ActiveRecord::Base
	has_many :books
end
