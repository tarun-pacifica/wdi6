class Client
	attr_accessor :name, :number_of_children, :age, :pets

	def initialize(name, number_of_children, age, pets)
		@name = name.downcase
		@number_of_children = number_of_children
		@age = age
		@pets = []

	end
	def to_s
		"The clients name is #{@name}, the nunmber of children are #{@number_of_children} and the ages are #{@age} with #{@pets.count} number of pets. "
	end
end