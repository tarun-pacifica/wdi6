class Apartment
	attr_accessor :name, :price, :sqft, :num_bathrooms, :num_bedrooms, :tenants
	
	def initialize(sqft, num_bathrooms, num_bedrooms, tenants)
		@price = 0
		@sqft = sqft
		@num_bedrooms = num_bedrooms
		@num_bathrooms = num_bathrooms
		@tenants = []
	end	

	def occupied?
		@tenants.any?
	end

	def to_s
		"#{ @apartment } is #{ sqft } square feet, has #{ num_bathrooms }, #{ num_bedrooms } and has #{ @tenants.length } occupants"
	end

end