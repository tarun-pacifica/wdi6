# == Schema Information
#
# Table name: mountains
#
#  id         :integer          not null, primary key
#  name       :text
#  country    :text
#  elevation  :float
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Mountain < ActiveRecord::Base
end
