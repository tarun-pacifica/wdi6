# == Schema Information
#
# Table name: books
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  author         :string(255)
#  publisher      :string(255)
#  published_date :date
#  image          :text
#  author_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Book < ActiveRecord::Base
	belongs_to :author
end 
