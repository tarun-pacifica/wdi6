# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  gender     :string(255)
#  dob        :date
#  genre      :string(255)
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Author < ActiveRecord::Base
  has_many :books
end
