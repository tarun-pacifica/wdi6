# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  price      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Price < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates_presence_of :price
  validates_numericality_of :price
end
