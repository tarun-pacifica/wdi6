class Apartment
	attr_accessor :name, :price, :sqft, :num_bathrooms, :num_bedrooms, :tenants

	def initialize(name, sqft, num_bathrooms, num_bedrooms)
		@name = name
		@price = 0
		@sqft = sqft
		@num_bathrooms = num_bathrooms
		@num_bedrooms = num_bedrooms
		@tenants = []
	end
	def occupied?
		@tenants.any?
	end
	def to_s
		"Apartment #{@name} is #{@sqft} square feet and has #{@num_bathrooms} bathrooms, #{@num_bedrooms} bedrooms and #{ @tenants.length} occupants. "
	end
end
