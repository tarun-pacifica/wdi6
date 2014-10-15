class Animal
	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species, toys)
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys
	end
	
	def to_s
		puts "Name: #{ @name }"
		puts "Age: #{ @age }"
		puts "Gender: #{ @gender }"
		puts "Species: #{ @species }"
		puts "Toys: #{ @toys }"
		puts ""
	end
end 