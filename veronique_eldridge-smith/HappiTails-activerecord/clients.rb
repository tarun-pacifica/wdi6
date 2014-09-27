class Client < ActiveRecord::Base
	has_many :animals

	def to_s
			
		if self.animals.length > 0
			"#{name} has #{children} children, and is #{age} years old and has the following pets: #{ self.animals.pluck(:name).join(', ') }"
		else 
			"#{name} has #{children} children, and is #{age} years old."
		end
		
	end


end

