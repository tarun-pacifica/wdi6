# Animal:
class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species)
		@name = name # An animal should have a name.
		@age = age # An animal should have an age.
		@gender = gender # An animal should have a gender.
		@species = species # An animal should have a species.
		@toys = [] # An animal can have multiple toys.
	end

	def to_s
		"#{@name} is a #{@species} and is #{@age} years old and #{@gender}"
	end
end







