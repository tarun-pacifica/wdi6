system ("clear")

 require_relative './client.rb'
 require_relative './animal.rb'
 require_relative './shelter.rb'

 require 'pry'


 # Seed data

 buddy = Animal.new('Buddy', 2, 'male', 'dog', 'ball')
 lilly = Animal.new('Lilly', 12, 'female', 'cat', 'string')

 annie = Client.new('Annie', 0, 19, 2)
 annie.pets << lilly

$happitails = Shelter.new
$happitails.clients << annie
$happitails.animals << buddy

# class Interface
# 	attr_accessor :happitails

# 	def initialize
# 		happitals = Shelter.new
# 	end

# 	def display_menu
# 	end

# 	...

# 	def start
# 		display_menu
# 		get
# 	end

# 	def x
# 		happitails.adopt_animal
# 	end


# end

def main_menu
	puts "Welcome to Happitails!"
	puts "Please choose from the options below"
	puts "1. Add Animal"
	puts "2. Create Client"
	puts "3. Adopt an animal"
	puts "4. Put animal up for adoption"
	puts "5. View all animals"
	puts "6. View all clients"


	# puts "Z. SECRET DEBUGGING MODE"

	puts "q. Quit"
end

def read_selection
	main_menu
	gets.chomp
end

response = read_selection

until response == 'q'

	case response
	when "1" # Add an animal
		puts "What is the name of your pet?"
		name = gets.chomp
		puts "How old is you pet?"
		age = gets.chomp
		puts "Is your pet male or female?"
		gender = gets.chomp
		puts "What is the species of your pet?"
		species = gets.chomp
		puts "What is your pets favourite toy?"
		toys = gets.chomp
		puts "Thank you for this information" 
		new_animal = Animal.new(name, age, gender, species, toys)
		$happitails.animals << new_animal
		puts "#{ new_animal.name } has been added."

	when "2" # Add a client
		puts "Please complete the following"
		puts "What's your name?"
		name = gets.chomp
		puts "How many children do you have?"
		children = gets.chomp
		puts "How old are you?"
		age = gets.chomp
		puts "How many pets do you currently have?"
		pets = gets.chomp
		 # Verify with interpolation
		puts "Thank you for this information"
		new_client = Client.new(name, children, age, pets)
		$happitails.clients << new_client
		puts "#{ new_client.name } has been added."

	when "3"
		puts "what is the clients name?"
		client_name = gets.chomp
		puts "What is the name of the animal the client wishes to adopt?"
		animal_name = gets.chomp

		$happitails.adopt_animal(animal_name, client_name)
	when "4"
		puts "What's the clients name?"
		client_name = gets.chomp
		puts "What's the name of the clients pet?"
		client_pet_name = gets.chomp

		# binding.pry
		$happitails.place_for_adoption(client_name, client_pet_name)
		# binding.pry

	when "5" # View all animals
		$happitails.animals.each do |view_animals|
		puts view_animals
	end

	when "6" # View all clients
		$happitails.clients.each do |view_clients|
		puts view_clients
	end
end

	
	# when "Z"
	# 	binding.pry
	# end

	# Read their next choice.
	response = read_selection
end

