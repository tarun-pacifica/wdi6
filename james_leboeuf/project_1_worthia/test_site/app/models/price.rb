class Price < ActiveRecord::Base
  belongs_to :item
  belongs_to :pricer, :class_name => "User"

  validates_presence_of :amount
  validates_presence_of :amount

end
