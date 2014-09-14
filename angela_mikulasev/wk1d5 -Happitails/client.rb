class Client
	attr_accessor :name, :number_of_children, :age, :pets

	def initialize (name, number_of_children, age, pets)
		@name = name
		@number_of_children
		@age = age
		@pets = []
	end

	def find_pet_by_name(pet_name)
		pets.find { |pet| pet.name == pet_name }
	end

	# Overriding the method in a superclass

	def to_s
		"#{ @name } has #{ @pets.count } pet/s"
	end 
end 