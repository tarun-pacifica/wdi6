system('clear')

require_relative './clients.rb'
require_relative './animals.rb'
require_relative './shelter.rb'

# require 'pry'

## Seed Data ##
# Client
james = Client.new('james', 27, 0, 1)

# Animals
capone = Animal.new('capone', 8, 'male', 'dog', "chew stick")
cally = Animal.new('cally', 9, 'female', 'dog', "marbles")

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
	gets.chomp.downcase
end

def display_title
	system('clear')
	puts "Shelter Program"
	puts "==============="
end

def any_key
	puts
	print "Press any key to continue..."
	gets.chomp
end

# Method to add client
def add_client
	display_title
	puts "--Add Client--"
	t = Client.new(ask('Name?'),ask('Age?'),ask('Number of Children?'),ask('Number of Pets that aren\'t from happy tails?'))
	$shelter.list_clients << t
	puts
	puts "#{ t.name } was added to the database!"
	puts
	any_key
end

# Method to add animal
def add_animal
	display_title
	puts "--Add Animal--"
	a = Animal.new(ask('Name?'),ask('Age?'),ask('Gender?'),ask('Species?'),ask('Toys?'))
	$shelter.list_animals << a
	puts
	puts "#{ a.name } was added to the database!"
	puts
	any_key
end

# Method to list clients
def list_shelter_clients
	display_title
	puts "--Happitails Client Database--"
	$shelter.list_clients.each do |c|
		puts c
		puts
	end
	any_key
end

# Method to list animals
def list_shelter_animals
	
	display_title
	puts "--Happitails Animal Database--"
	if $shelter.list_animals.length == 0 # Can't compare empty array with a number. Have to compare .length or .count to 0.
	puts "There are currently no animals in the database."
	puts
	else
	$shelter.list_animals.each do |a|
		puts a
		puts
		end
	end
	any_key
end

def abandon
	display_title
	puts "--Happitails Pet Donation--"
	new_client_input = ask("Are you new to the Shelter? (Y/N)")
		if new_client_input == "y"
			puts "You must be part of the shelter to abandon your pets"
			puts "Please register as a new client"
			return
		else
			puts "Please pick your name from the database"
			list_shelter_clients
			client_user_input = ask('Which user are you?')
			found_client = $shelter.list_clients.find { |f| f.name == client_user_input }
			if found_client == nil
				puts "Sorry your not in the database"
				return # Return means getting out of the function or return value. But we just use it here to stop running.
			else
				puts "Thanks #{found_client.name }! We found you"
			end
		end
	add_animal
end


def adopt_animal
	display_title
	puts "--Happitails Pet Adoption--"
	list_shelter_clients
	client_user_input = ask("Which user are you?") 
	#The ask method/question, the answer that gets returned, gets saved in ruby and needs to be set to variable, so it can be saved. to be called again.
	# Find works by saying give me the element in which this condition returns true. Think about what its returning.
	found_client = $shelter.list_clients.find { |f| f.name == client_user_input }
	if found_client == nil
		puts "Sorry your not in the database"
		puts
		puts "Please register as a new client"
		puts
		return # Return means getting out of the function or return value. But we just use it here to stop running.
	else
		puts "Thanks #{ found_client.name }. We found you!"
		puts
	end
	puts "Here is a list of all our animals available for adoption"
	$shelter.list_animals.each do |a|
		puts a
		puts
	end
	animal_user_input = ask("Which animal would you like to adopt?")
	found_animal = $shelter.list_animals.find { |f| f.name == animal_user_input }
	if found_animal == nil
		puts "Sorry that animal is not in the database"
		puts
		return
	end
	found_client.pets << $shelter.list_animals.delete(found_animal)
	puts "#{ found_animal.name } has been adopted by #{ found_client.name }"
	puts
	any_key
end

def read_selection
	input = gets.chomp.downcase
	exit if input == 'q'
	input
end

def menu
	display_title
	puts "1. Display all animals."
	puts "2. Display all clients."
	puts "3. Create an animal."
	puts "4. Create a client."
	puts "5. Adopt an animal."
	puts "6. Put animal up for adoption."
	puts "Q. Quit"
	print "Enter your selection: "

	user_choice = read_selection

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
	running = true
end

running = true
while running
	running = menu
end

# binding.pry