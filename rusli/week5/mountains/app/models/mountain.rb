# == Schema Information
#
# Table name: mountains
#
#  id       :integer          not null, primary key
#  mountain :string(255)
#  feet     :float
#  country  :text
#  category :text
#  eruption :integer
#

class Mountain < ActiveRecord::Base
end 
