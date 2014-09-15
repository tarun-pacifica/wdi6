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
     "#{ @name } is a #{ age } year old, #{ gender } #{ species } who wields a #{ toys }."
	end
end 