class Building
	attr_accessor :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments

	def initialize(address, style, has_doorman, has_elevator, num_floors, apartments)
		@address = address
		@style = style
		@has_doorman = has_doorman
		@has_elevator = has_elevator
		@num_floors = num_floors
		@apartments = {}
	end

	def to_s
		"This #{@style} style building at #{@address} has #{ @apartments.length} apartments with #{@has_doorman} doorman and #{@has_elevator} elevators for this #{@num_floors} building. "
	end







end

