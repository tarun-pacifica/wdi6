class Client
	attr_accessor :name, :age, :number_of_children, :pets, :other_pets

	def initialize(name, age, number_of_children, other_pets) # Don't need to ask for @pets, because if they are new client they wouldn't have any pets anyway from the shelter
		@name = name
		@age = age
		@number_of_children = number_of_children
		@pets = []
		@other_pets = other_pets.to_i
	end

	# Over-riding the to_s method.
	def to_s
		"#{ name } is #{ age } years old, has #{ number_of_children } children, and #{ pets.count + other_pets } pets. "
	end

end
