class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize (name, age, gender, species, toys)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys
	end
end

def to_s
	" #{ name } is #{ age } years old and is a #{ gender }. Your pet is a #{ species }  and its favourite toy/s is #{ toys }."
end
