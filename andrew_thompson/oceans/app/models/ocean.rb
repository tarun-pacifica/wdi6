# == Schema Information
#
# Table name: oceans
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :text
#  volume     :float
#  area       :float
#  depth      :float
#  bounded_by :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Ocean < ActiveRecord::Base

end
