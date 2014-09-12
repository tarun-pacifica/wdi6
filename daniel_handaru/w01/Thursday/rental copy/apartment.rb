class Apartment
	attr_accessor :name, :sqft, :num_bedrooms, :nums_bathrooms, :people

	def initialize(name, sqft, num_bathrooms, num_bedrooms, people)
		@name = name
		@sqft = sqft
		@num_bathrooms = num_bathrooms
		@num_bedrooms = num_bedrooms
		@people = people
	end


	def occupied?
		@tennants.any?
	end


	def to_s
		"The apartment at #{@name} is #{@sqft} square feet and has #{@people} occupants.
		 It contains #{@num_bedrooms} bedrooms and #{@num_bathrooms} bathrooms."
	end


end