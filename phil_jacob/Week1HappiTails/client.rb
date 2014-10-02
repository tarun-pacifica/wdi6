class Client
	attr_accessor :name, :age, :gender, :children, :pets, :adopt, :abandon
 
	def initialize(name, age, gender, children, pets)
		@name = name
		@age = age
		@gender = gender
		@children = children
		@pets = pets
	end
 	
 	def to_s
 		 "#{name.upcase } is a #{ age } year old, #{ gender } animal lover with #{ children } children and #{ pets } pets. "
	end
end