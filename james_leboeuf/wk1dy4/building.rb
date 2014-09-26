class Building
	attr_accessor :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments

	def initialize(address, style, has_doorman, has_elevator, num_floors)
		@address = address
		@style = style
		@has_doorman = has_doorman
		@has_elevator = has_elevator
		@num_floors = num_floors
		@apartments = {} # Be able to look up immediately
	end

	def to_s
		"There are #{ $buildings.length } total buildings."
		"Building at #{ address } has #{ @style } style. It contains #{ @apartments.length } apartment(s)."
	end

end
