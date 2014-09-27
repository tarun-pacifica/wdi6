class Animal < ActiveRecord::Base
	belongs_to :client
	has_many :toys

	def to_s
		s = "#{name} is a #{species} and is #{age} years old and #{gender}"
		s += " and belongs to: #{ self.client.name }" if self.client
		s
	end
end







