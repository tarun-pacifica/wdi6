# == Schema Information
#
# Table name: oceans
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :text
#  islands    :float
#  volume     :float
#  area       :float
#  created_at :datetime
#  updated_at :datetime
#

class Ocean < ActiveRecord::Base

end
