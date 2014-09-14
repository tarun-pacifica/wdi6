class Shelter
	attr_accessor :clients, :animals

	def initialize
		@clients = []
		@animals = []
	end

	def adopt_animal(animal_name, client_name)
		animal = find_animal_by_name(animal_name)
		client = find_client_by_name(client_name)

       	client.pets << animal
       	animals.delete(animal)
	end

	def place_for_adoption(client_name, client_pet_name)
		client = find_client_by_name(client_name)
		pet = client.find_pet_by_name(client_pet_name)

		animals << pet
		client.pets.delete(pet)
	end

	private

	# You cant call these methods outside of the class instance
	# Public methods can call private methods if they're in the same class
	def find_animal_by_name(animal_name)
        animals.find { |animal| animal.name == animal_name }
	end

	def find_client_by_name(client_name)
		clients.find { |client| client.name == client_name }
	end
end
