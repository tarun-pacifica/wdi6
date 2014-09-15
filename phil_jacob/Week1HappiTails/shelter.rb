class Shelter
	attr_reader :name, :available_animals, :clients
 
	def initialize
		@name = name
		@available_animals = []
		@clients = []
	
	end
	
	def do_adopt (client_name, pet_name)
   @clients[client_name].pets[pet_name] = @available_animals.delete(pet_name)
	end

	def receive_abandon (client_name, pet_name)
    @available_animals[pet_name] = @clients[client_name].pets.delete(pet_name)
	end

	def to_s
		 "#{ name } is an animal shelter with #{ shelter_clients } and housing #{ shelter_animals}."
	end
end
 