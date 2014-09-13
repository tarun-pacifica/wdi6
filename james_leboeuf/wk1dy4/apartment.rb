class Apartment
	attr_accessor :name, :price, :sqft, :num_bathrooms, :tenants

	def initialize(name, sqft, num_bathrooms, num_bedrooms)
		@name = name
		@price = 0
		@sqft = sqft
		@num_bathrooms = num_bathrooms
		@num_bedrooms = num_bedrooms
		@tenants = []
	end

	def occupied? #Will return true or false
		@tenants.any?
	end


	def to_s
		 "#{ @name } is #{ @sqft } square feet and has #{ @tenants.length } occupants."
	end
end