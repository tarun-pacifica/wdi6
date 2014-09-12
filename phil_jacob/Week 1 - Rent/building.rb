class Building
	attr_accessor :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments

	def initialize(address, style, has_doorman, has_elevator, num_floors)
		@address = address
		@style = style
		@has_doorman = has_doorman
		@num_floors = num_floors
		@apartments = {}
	end

	def to_s
		"This #{ @style } style building at #{ address } contains #{num_floors} floors, has #{ @apartments.length} apartments as well as featuring a #{ has_doorman } and #{ has_elevator}".
	end
end

