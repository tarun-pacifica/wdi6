# Client:
class Client
	attr_accessor :name, :children, :age, :pets

	def initialize(name, children, age)
		@name = name # A client should have a name.
		@children = children # A client should have a number of children.
		@age = age # A client should have an age.
		@pets = {} # A client should have a hash of pets (with pet names as keys and animal (object) as values)
	end

	def to_s
		"#{@name} has #{@children} children, and it #{@age} years old and has the following pets: #{@pets}"
	end
end


# A client should be able to accept a pet and add it to their pets list
# A client should be able to give up a pet from their list