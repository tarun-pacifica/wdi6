class Item < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  has_many :prices
  has_many :pricers, :through => :prices

  # validates_presence_of :title
  # validates_presence_of :description

end
