# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  price      :float
#  country    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Price < ActiveRecord::Base
  belongs_to :users
  belongs_to :items
end
