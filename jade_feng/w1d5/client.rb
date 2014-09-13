# Client:
# A client should have a name.
# A client should have a number of children.
# A client should have an age.
# A client should have a number of pets.

class Client
	attr_accessor :name, :gender, :num_children, :age, :pets

	def initialize(name, gender, num_children, age)
		@name = name
		@gender = gender
		@num_children = num_children
		@age = age
		@pets = []
	end

	def to_s
		"#{name.upcase} is a #{age}-years-old #{gender.downcase} with #{num_children} and #{ pets.length } pets."
	end

end
