class Client
	attr_accessor :name, :age, :children, :pets

	def initialize(name, age, children, pets)
		@name = name
		@age = age
		@children = children
		@pets = []
	end

	def to_s
		"#{ @name } is a #{ @age } years old #{ @gender } and has #{ @children } kids and #{ @pets.length } pets."
	end
end