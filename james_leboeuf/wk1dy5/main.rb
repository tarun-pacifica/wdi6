system('clear')

require_relative './clients.rb'
require_relative './animals.rb'
require_relative './shelter.rb'

require 'pry'

# when looking in list_animals. adoptee = animals.delete_at 0
# clients[0] << animals.delete_at 0
# animals.delete_at 0

## Seed Data ##
# Client
james = Client.new('James', 27, 0, 1)

# Animals
capone = Animal.new('Capone', 8, 'male', 'dog', "chew stick")
cally = Animal.new('Cally', 9, 'female', 'dog', "marbles")

# Global Variable to store data. Has scope to be accessed at any level (i.e. def function).
$shelter = Shelter.new

# Push new client (james) into shelter
$shelter.list_clients << james

# Add capone into clients (james) pets list
# Capone gets added to pets [] because we set james = Client.new, and that has access to the pets function
$shelter.list_clients[0].pets << capone

# Add a new animal into the shelter list_animals
$shelter.list_animals << cally

# Manually takes out all the hard coding
def ask(question)
	puts question
	gets.chomp
end

def display_title
	puts "\e[H\e[2J"
	puts "Shelter Program"
	puts "==============="
end

# Method to add client
def add_client
	display_title
	t = Client.new(ask('Name?'),ask('Age?'),ask('Number of Children?'),ask('Number of Pets that aren\'t from happy tails?'))
	$shelter.list_clients << t
	puts "#{ t.name } was added to the database!"
	t
end

# Method to add animal
def add_animal
	display_title
	a = Animal.new(ask('Name?'),ask('Age?'),ask('Gender?'),ask('Species?'),ask('Toys?'))
	$shelter.list_animals << a
	puts "#{ a.name } was added to the database!"
end

# Method to list clients
def list_shelter_clients
	display_title
	$shelter.list_clients.each do |c|
		puts c
	end
end

# Method to list animals
def list_shelter_animals
	display_title
	if $shelter.list_animals.length == 0 # Can't compare empty array with a number. Have to compare .length or .count to 0.
	puts "There are currently no animals in the database."
	else
	$shelter.list_animals.each do |a|
		puts a
		end
	end
end

# Step 1: Ask if user is a new user?
# Step 2: Ask to register into the system if new user, else sign into name
# Step 3: Ask what animal they would like to put up for adoption
# Step 4: 
def abandon
	new_client_input = ask("Are you new to the Shelter? (Y/N)")
		if new_client_input == "Y"
			puts "You must be part of the shelter to abandon your pets"
			puts "Please register as a new client"
			return
		else
			puts "Please pick your name from the database"
			list_shelter_clients
			client_user_input = ask('Which user are you?')
			found_client = $shelter.list_clients.find { |f| f.name == client_user_input }
			if found_client == nil
				puts "Sorry your not in the database "
				return # Return means getting out of the function or return value. But we just use it here to stop running.
			else
				puts "Thanks #{found_client.name }! We found you!"
			end
		end
	add_animal
end


def adopt_animal
	list_shelter_clients
	client_user_input = ask('Which user are you?') 
	#The ask method/question, the answer that gets returned, gets saved in ruby and needs to be set to variable, so it can be saved. to be called again.
	# Find works by saying give me the element in which this condition returns true. Think about what its returning.
	found_client = $shelter.list_clients.find { |f| f.name == client_user_input }
	
	if found_client == nil
		puts "Sorry your not in the database "
		return # Return means getting out of the function or return value. But we just use it here to stop running.
	else
		puts "Thanks #{found_client.name }! We found you!"
	end
	puts "Here is a list of all our animals available for adoption "
	$shelter.list_animals.each do |a|
		puts a
	end
	animal_user_input = ask("Which animal would you like to adopt?")
	found_animal = $shelter.list_animals.find { |f| f.name == animal_user_input }
	if found_animal == nil
		puts "Sorry that animal is not in the database "
		return
	end
	found_client.pets << $shelter.list_animals.delete(found_animal)
	puts  "#{ found_animal.name } has been adopted by #{ found_client.name }. "
end

def quit_menu_program
	ask("q. Quit")
	input = gets.chomp
	exit if input == 'Q'
	input
end

def menu
	puts "1. Display all animals."
	puts "2. Display all clients."
	puts "3. Create an animal."
	puts "4. Create a client."
	puts "5. Adopt an animal."
	puts "6. Put animal up for adoption."
	puts "Q. Quit"
	print "Enter your selection: "
end

def read_selection
	menu
	gets.chomp.upcase
end

# def display_title
# 	system('clear')
# 	puts "Shelter Program"
# 	puts "--------------"
# end

user_choice = read_selection

until user_choice == 'Q'
	case user_choice
	when '1'
		list_shelter_animals
	when '2'
		list_shelter_clients
	when '3'
		add_animal
	when '4'
		add_client
	when '5'
		adopt_animal
	when '6'
		abandon
	end
	user_choice = read_selection
end

# when looking in list_animals. adoptee = animals.delete_at 0
# clients[0] << animals.delete_at 0
# animals.delete_at 0


# def 
# end


# Adopting
# animal_name_adopt = gets.chomp
# shelter.animals.delete(animal_name_adopt)


# Specification:
# create client class with all attributes
# create client initialize with functions and arguments
# create animals class with all attributes
# create animal initailize with functions and arguments
# Require selected files
# Create 1 seed data for each
# Create Shelter class with client and animal attributes to have empty arrays for each
# Test
# Create 1 global variable for shelter that holds animals and clients
# Test
# Push seed data into shelter
# Create add client
# Test
# Create add animal
# Test
# Create list clients
# Test
# Create list animals
# Test
# Test to see if can already see list clients and list animals seed data

# Object Specs:

# Animal:

# An animal should have a name.
# An animal should have an age.
# An animal should have a gender.
# An animal should have a species.
# An animal can have multiple toys.
# Client:

# A client should have a name.
# A client should have an age.
# A client should have a number of children.
# A client should have a number of pets.
# Shelter:

# The shelter should display all the clients.
# The shelter should display all the animals.
# The shelter should display all the animals.
# Relationships:

# A client should be able to adopt an animal.
# A client should be able to put an animal up for adoption
# Phase 1

# Can create animals and clients
# Phase 2

# New animals and clients can be added to the shelter
# Phase 3

# When creating an animal or client, the user is prompted for information like names, gender etc.
# Phase 4

# At start, the user is prompted with a menu of options:

# display all animals
# display all clients
# create an animal
# create an client
# facilitate client adopts an animal
# facilitate client puts an animal up for adoption
# After selecting from the menu the task the user is prompted through the entire process

# binding.pry