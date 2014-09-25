require 'pry'

require_relative './shelters.rb' 
require_relative './clients.rb'
require_relative './animals.rb'

# Relationships:

# The shelter should be able to give a pet to a client
# The shelter should be able to accept pets from clients

#########################******* DATA ***********###########################
#**************************#####*******######*******************************#

# Instantiate a Shelter 
$shelter = Shelter.new('HappiTails', '101 Dalmation St')

# Instantiate clients.  Insert them into the shelter's clients hash
$shelter.clients['Bob'] = Client.new('Bob', 0, 'male')
$shelter.clients['Sue'] = Client.new('Sue', 2, 'female')
$shelter.clients['Jil'] = Client.new('Jil', 1, 'female')
$shelter.clients['Sam'] = Client.new('Sam', 3, 'male')

# Instantiate animals.  Insert them into the shelter's animals hash
$shelter.animals['Spot'] = Animal.new('Spot', 3, 'male', 'Dog')
$shelter.animals['Spot'].toys << 'Bone'
$shelter.animals['Lassy'] = Animal.new('Lassy', 2, 'female', 'Dog')
$shelter.animals['Lassy'].toys << 'Frisbee' << 'Bone'
$shelter.animals['Molly'] = Animal.new('Molly', 5, 'female', 'Cat')
$shelter.animals['Molly'].toys << 'Rope' << 'Chew Toy' << 'Frisbee'
$shelter.animals['Fido'] = Animal.new('Fido', 8, 'male', 'Dog')
# $shelter.animals['Fido'].toys << 'Chew Toy'
$shelter.animals['Sport'] = Animal.new('Sport', 1, 'male', 'Dog')
# $shelter.animals['Sport'].toys << 'Treats'
$shelter.animals['Chirpy'] = Animal.new('Chirpy', 2, 'female', 'Bird')

#**************************#####*******######*******************************#

##########################****** MAIN MENU ********###########################

def main_menu
	puts "Welcome to *** HAPPITAILS *** Animal Shelter!"
	puts "1. Display all animals"
	puts "2. Display all clients"
	puts "3. Create an animal"
	puts "4. Create a client"
	puts "5. Facilitate animal adoption by existing client"  # give a pet to a client
	puts "6. Put an animal up for adpotion"  # accept a pet from a client
	puts "q. Quit"
end

#**************************#####*******######*******************************#

main_menu
main_menu_option = gets.chomp.downcase


until main_menu_option == 'q'
	case main_menu_option

	##########################****** LIST ANIMALS ********###########################

	when '1'
		$shelter.animals.each do |name, animal|
			puts animal
		end

	##########################****** LIST CLIENTS ********#########################

	when '2'
		$shelter.clients.each do |name, client|
			puts client
		end

	##########################****** CREATE ANIMALS ********#########################

	when '3'
		puts "What is the animal's name?"
		name = gets.chomp
		puts "What is the animal's age?"
		age = gets.to_i
		puts "What is the animal's gender?"
		gender = gets.chomp
		puts "What is the animal's species?"
		species = gets.chomp

		$shelter.animals[name] = Animal.new(name, age, gender, species)

	##########################****** CREATE CLIENT ********#########################	

	when '4'
		puts "What is the clients's name?"
		name = gets.chomp
		puts "How many children does he/she have?"
		children = gets.to_i
		puts "What is the client's age?"
		gender = gets.chomp
	
		$shelter.clients[name] = Client.new(name, children, gender)
		# binding.pry

	################****** FACILITATE ANIMAL ADOPTION BY EXISTING CLIENT ********###############

	when '5'
		print "Enter the name of the client who is adopting an animal: "
		client_name = gets.chomp
		print "Enter the name of the animal he/she would like to adopt: "
		animal_name = gets.chomp
		$shelter.clients[client_name].pets[animal_name] = $shelter.animals[animal_name]
		$shelter.animals[animal_name] = nil

	################****** PUT ANIMAL UP FOR ADOPTION ********###############

	when '6' 
		print "What is the name of the client who is rejecting the pet: "
		client_name = gets.chomp
		print "What is the name of the pet: "
		animal_name = gets.chomp
		animal_age = $shelter.clients[client_name].pets[1]
		animal_gender = $shelter.clients[client_name].pets[2]
		animal_species = $shelter.clients[client_name].pets[3]
		$shelter.animals[animal_name] = Animal.new(animal_name, animal_age, animal_gender, animal_species)
		$shelter.clients[client_name].pets.delete(animal_name)


	end
	main_menu
	main_menu_option = gets.chomp.downcase
end

# binding.pry

