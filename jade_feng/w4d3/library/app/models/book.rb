# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  series     :string(255)
#  language   :string(255)
#  genre      :string(255)
#  published  :integer
#  image      :text
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  duedate    :date
#

class Book < ActiveRecord::Base
	belongs_to :author
	belongs_to :user
end
