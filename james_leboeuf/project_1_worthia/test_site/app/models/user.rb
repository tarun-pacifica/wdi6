class User < ActiveRecord::Base
  has_many :items, :foreign_key => "owner_id"
  has_many :prices, :foreign_key => "owner_id"
  has_many :price_on_items, :through => :prices, :source => :item
end
