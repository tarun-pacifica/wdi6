# == Schema Information
#
# Table name: item_prices
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  price      :float
#  country    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Item_price < ActiveRecord::Base
  belongs_to :users 
  belongs_to :items 
end
