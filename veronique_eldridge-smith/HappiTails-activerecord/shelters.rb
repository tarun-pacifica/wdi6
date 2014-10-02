class Shelter < ActiveRecord::Base
	has_many :clients
	has_many :animals

	def to_s
		"This shelter has the following clients: #{@clients}"
		"This shelter has the following animals: #{@animals}"
	end

end
