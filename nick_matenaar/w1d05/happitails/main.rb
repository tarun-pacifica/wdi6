require_relative './animal.rb'
require_relative './client.rb'

# GLOBALS

$animals = [] 
$clients = []
$sheltered = [] 

# SEED DATA

ani_1 = Animal.new("George", 7, "Male", "Dog")
ani_2 = Animal.new("Ralph", 3, "Male", "Dog")
ani_3 = Animal.new("Ruby", 5, "Female", "Dog")
ani_4 = Animal.new("Fred", 10, "Male", "Cat")
ani_5 = Animal.new("Lily", 4, "Female", "Cat")

cli_1 = Client.new("Nick Tho", 22)
cli_2 = Client.new("Miley Cyrus", 24, 1)
cli_3 = Client.new("Tony Rudd", 40) 

cli_1.pets << ani_1 << ani_2
cli_2.pets << ani_3 <<  ani_4
cli_3.pets << ani_5 

# LOAD DATA 

$animals << ani_1 << ani_2 << ani_3 << ani_4 << ani_5
$clients << cli_1 << cli_2 << cli_3 

def list_animals(client = nil)
	if client == nil 
		puts "Listing all #{$animals.length} animals... "
		puts 
		$animals.each do |x|
			puts "#{$animals.index(x)}. #{x}" 
		end 
	elsif $clients[client.to_i].nil? 
		puts "Could not find that client in our database" 
	else
		puts "Listing all #{$clients[client.to_i].name}'s #{$clients[client.to_i].pets.length} pets..."
		puts
		$clients[client.to_i].pets.each do |x|
			puts "#{$clients[client.to_i].pets.index(x)}. #{x}"
		end 
	end
end 

def list_shelter_animals
 puts "Listing all #{$sheltered.length} sheltered animals... "
 $sheltered.each do |s|
 	puts "#{$sheltered.index(s)}. #{s}"
 end 
end 

def list_clients 
	puts "Listing all #{$clients.length} clients... "
	puts 
	$clients.each do |x|
		puts "#{$clients.index(x)}. #{x}"
	end 
end 

def display_title
	system('clear')
	puts "Happitails"
	puts "----------"
	puts 
end 

def get_choice 
	puts "q. Quit"
	puts
	print "Enter your selection: "
	input = gets.chomp.downcase 
	if input == "q"
		system('clear')
		exit
	end 
	input
end 

def any_key
	puts 
	print "Press any key to continue..."
	gets.chomp 
end 

def get_selection(msg)
	display_title
	puts msg
	get_choice
end 

def display_msg(msg)
	display_title
	puts msg
	any_key	
end


system('clear')
list_animals 
puts	
list_animals(1)
puts	
list_animals(0)
puts 
list_clients

def menu 
	display_title
	puts "1. Client Menu"
	puts "2. Shelter Menu"
	user_choice = get_choice

	case user_choice
	when "1" # CLIENT MENU 
		display_title
		puts "1. New Client"
		puts "2. Existing Client"
		user_choice = get_choice

		case user_choice
		when "1" # NEW CLIENT		
			user_name = get_selection("Please enter your name")
			user_age = get_selection("Please enter your age")
			user_children = get_selection("How many children do you have?").to_i

			$clients << Client.new(user_name, user_age, user_children)

			display_msg("Success! #{user_name} has been added to the system")

		when "2" # EXISTING CLIENT 
			user_name = get_selection("Please enter your name to log-in")
			user_client = $clients.index { |x| x.name.downcase == user_name }
			
			unless user_client.nil?
				display_title 
				puts "Welcome #{$clients[user_client].name}"
				puts
				puts "0. View Information" 
				puts "1. Update information"
				puts "2. View pets"
				puts "3. Put up pet for adoption"
				puts "4. Adopt pet"
				user_choice = get_choice

				case user_choice
				when "0" # VIEW INFORMATION 
					display_msg($clients[user_client])

				when "1" # UPDATE INFORMATION 
					user_name = get_selection("Please enter your name")
					user_age = get_selection("Please enter your age")
					user_children = get_selection("How many children do you have?")

					$clients[user_client].name = user_name
					$clients[user_client].age = user_age.to_i
					$clients[user_client].children = user_children.to_i 

					display_msg("Success! You've updated your details")

				when "2" # VIEW PETS
					display_msg(list_animals(user_client))
				when "3" # PUT UP PET FOR ADOPTION 
					display_title
					puts "Please select one of your pets to put up for adoption"
					puts
					list_animals(user_client)
					user_choice = get_choice

					unless $clients[user_client].pets[user_choice.to_i].nil?
						$sheltered << $clients[user_client].pets[user_choice.to_i]
						$clients[user_client].pets.delete_at(user_choice.to_i)
						display_msg("Success! Your pet has been put up for adoption")
					else 
						display_msg("That pet does not exist")
					end
				when "4" # ADOPT A PET
					display_title
					puts "Please select which animal you would like to adopt"
					puts
					list_shelter_animals
					user_choice = get_choice

					unless $sheltered[user_choice.to_i].nil?
						$clients[user_client].pets << $sheltered[user_choice.to_i]
						$sheltered.delete_at(user_choice.to_i)
						display_msg "Success! You've adopted a pet!"
					else
						display_msg "That animal does not exist"
					end 
				end 

			else
				display_msg "That username does not exist"
			end  
		else
			display_msg "That menu item does not exist"
		end 

	when "2" # SHELTER MENU
		display_title
		puts "1. Display all Animals" 
		puts "2. Display all Animals in Shelter"
		puts "3. Display all Clients"
		puts "4. List Animal for Adoption"
		puts "5. Put Down Animal"
		user_choice = get_choice

		case user_choice
		when "1" # List all animals
			display_msg list_animals
		when "2" # List all sheltered animals
			display_msg list_shelter_animals
		when "3" # List all clients
			display_msg list_clients
		when "4" # Create animal for adoption 
			ani_name = get_selection "Please enter animal name"
			ani_age = get_selection "Please enter animal age"
			ani_gender = get_selection "Please enter animal gender"
			ani_species = get_selection "Please enter animal species"

			$animals << Animal.new(ani_name, ani_age, ani_gender, ani_species)
			$sheltered << $animals.last 
			display_msg "Success! #{$sheltered.last.name} has been added to the adoption list"
		when "5"  # Put Down Animal
			display_title
			puts "Please select which animal in the shelter you have to put down"
			puts
			list_shelter_animals
			user_choice = get_choice

			$animals.delete($sheltered[user_choice.to_i])
			$sheltered.delete_at(user_choice.to_i)

			display_msg "That animal has been put down... "

		else 
			display_msg "That menu item does not exist"
		end 

	end 

return true
end 

running = true 

while running 
	running = menu
end 

system('clear')
