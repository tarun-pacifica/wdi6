class Building
	attr_accessor :name, :address, :style, :has_doorman, :has_elevator, :num_floors, :apartments


	def initialize(name, address, style, has_doorman, has_elevator, num_floors, apartments)
		@name = name
		@address = address
		@style = style
		@has_doorman = has_doorman
		@has_elevator = has_elevator
		@num_floors = num_floors
		@apartments = apartments
	end

	def to_s #turns into a string
		"#{@name} is a #{@style} style building and is located at #{@address}. It contains #{@apartments} apartments.
		Has doorman? #{@has_doorman}. Has elevator? #{@has_elevator}.
		"
	end

end