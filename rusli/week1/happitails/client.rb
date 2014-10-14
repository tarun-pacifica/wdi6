class Client 
	attr_accessor :name, :number_of_child, :client_age, :number_of_pets

	def initialize(name, number_of_child, client_age, number_of_pets)
		@name = name 
		@number_of_child = number_of_child
		@client_age = client_age
		@number_of_pets = []
	end

	def to_s
		"#{ @name } has #{ @number_of_pets } pet(s)"
	end 
	
end 
