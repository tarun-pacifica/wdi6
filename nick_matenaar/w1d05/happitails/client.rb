class Client
	attr_accessor :name, :children, :age, :pets 

	def initialize(name, age, children = 0, pets = [])
		@name = name
		@age = age
		@children = children 
		@pets = pets 
	end 

	def to_s 
		"#{@name} is #{@age} years old. With #{@children} children and #{@pets.length} pets."
	end 
end 

