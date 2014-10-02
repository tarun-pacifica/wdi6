# Shelter:
class Shelter
	attr_accessor :clients, :animals

	def initialize(name, address)
		@name = name  # Shelter name of 'Happitails'
		@address = address # The shelter should have an address.
		@clients = {} # The shelter should be able to return all the clients.
		@animals = {} # The shelter should be able to return all the animals.
	end

	def to_s
		"This shelter has the following clients: #{@clients}"
		"This shelter has the following animals: #{@animals}"
	end

end


# The shelter should be able to accept an animal (add to it's list).
# The shelter should be able to accept a client (add to it's list).
