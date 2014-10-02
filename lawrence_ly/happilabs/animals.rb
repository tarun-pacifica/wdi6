class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species,toys)
		@name = name.downcase
		@age = age
		@gender = gender
		@species = species
		@toys = []
		@toys << toys

	end
	def to_s
		"The name of the animal is #{@name}, #{@name}'s age is #{@age}, gender is #{@gender} and the breed is #{@species} and the number of toys are #{@toys.count}. "
	end
end