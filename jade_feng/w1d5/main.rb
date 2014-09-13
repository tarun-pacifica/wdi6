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

#######################################################
system('clear')

require_relative './client.rb'					#Go into the file directory and link to the Tenant.rb file
require_relative './animal.rb'
# require_relative './shelter.rb'

#######################################################
# Global arrays 

$animals = []
$clients = []

#######################################################

# Preliminary Test Data
pet1 = Animal.new("Rex", 5, "male", "dog", 0, "unadopted")
pet2 = Animal.new("Polly", 10, "female", "bird", 1, "John")
pet3 = Animal.new("Kitty", 1, "male", "cat", 2, "unadopted")
pet4 = Animal.new("Thumper", 2, "female", "rabbit", 3, "Sarah")


person1 = Client.new("Sarah", "female", 0, 30)
person2 = Client.new("John", "male", 2, 24)
person3 = Client.new("Adam", "male", 3, 29)

##Seed data -- only for the testing stage.

$animals << pet1 << pet2 << pet3 << pet4
$clients << person1 << person2 << person3 
 
# p $animals
# p $clients

#######################################################
def menu_origin
	puts "--- Welcome to the HappiTails animal shelter ---"
	puts "         ▄              ▄ "
	puts "        ▌▒█           ▄▀▒▌ "
	puts "        ▌▒▒▀▄       ▄▀▒▒▒▐ "
	puts "       ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐ "
	puts "     ▄▄▀▒▒▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐ "
	puts "   ▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀██▀▒▌ "
	puts "  ▐▒▒▒▄▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄▒▒▌ "
	puts "  ▌▒▒▐▄█▀▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐ "
	puts " ▐▒▒▒▒▒▒▒▒▒▒▒▌██▀▒▒▒▒▒▒▒▒▀▄▌ "
	puts " ▌▒▀▄██▄▒▒▒▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌ "
	puts " ▌▀▐▄█▄█▌▄▒▀▒▒▒▒▒▒░░░░░░▒▒▒▐ "
	puts "▐▒▀▐▀▐▀▒▒▄▄▒▄▒▒▒▒▒░░░░░░▒▒▒▒▌ "
	puts "▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒░░░░░░▒▒▒▐ "
	puts " ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒▒▒░░░░▒▒▒▒▌ "
	puts " ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐ "
	puts "  ▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▒▒▒▒▌ "
	puts "    ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀ "
	puts "   ▐▀▒▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀ "
	puts "   ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▀▀ "
	puts "1. List all the animals."
	puts "2. List all the clients."
	puts "3. Add an animal."
	puts "4. Add a client."
	puts "5. Change an animal."
	puts "6. Change a client."
	# puts "7. Client adopts an animal."
	# puts "8. Client offers an animal for adoption."
	puts "q. Quit."
	puts "What is your selection?"
end

def selection_menu
	menu_origin
	gets.chomp.downcase
end

user_selection_menu = selection_menu 

################################################################

def select_animal
	puts "There a lots of animals here that are looking for a new home. What kind of furry companion are you interested in meeting?"
	puts "1. Cats! Meow!"
	puts "2. Dogs! Woof!"
	puts "3. Birds! Tweet!"
	puts "4. Rabbits! Thump thump!"
	puts "5. All the animals! Adopted and non-adopted!"
	puts "q. Back to the home menu."
end

def selection_animal
	select_animal
	gets.chomp.downcase
end

def list_the_animal_of_species(type_of_animal)
	puts "List all the #{type_of_animal}s."
	$animals.each do |c|
		if c.species == type_of_animal && c.owner == "unadopted"
			puts c
		end
	end
end

################################################################


until user_selection_menu == 'q'
	case user_selection_menu

	when "1"
		system("clear")
		#List all the animals
		user_selection_animal = selection_animal
		
		unless user_selection_animal == "q"  		# User chooses animals they want to see.
			case user_selection_animal
			when "1"
				list_the_animal_of_species("cat")	
			when "2" 								# Dogs
				list_the_animal_of_species("dog")	
			when "3" 								# Birds
				list_the_animal_of_species("bird")	
			when "4" 								# Rabbits
				list_the_animal_of_species("rabbit")	
			when "5" 								# All the animals
				$animals.each do |x|
					puts x
				end
			else 
				puts "We don't have that animal on hand! Come back next week and we'll see what we've got!"
			end			 	
		end 

		user_selection_menu = selection_menu 

	when "2"
		puts "List all the clients"
		$clients.each do |c|
			puts c
		end			

		# Go into each client and List their pets 
		puts "Whose pets would you like to check?"
		client_name = gets.chomp.downcase

		$animals.each do |ani|
			if ani.owner.downcase == client_name.downcase
				puts ani
			end 
		end
		user_selection_menu = selection_menu 
	
	when "3"
		system("clear")
		puts "Add an animal"

		puts "What is the animal's name?"
		@animal_name_n = gets.chomp.downcase 
		puts "What is the animal's age?"
		@animal_age_n = gets.chomp.downcase
		puts "What is the animal's gender?"
		@animal_gender_n = gets.chomp.downcase
		puts "What is the animal's species?"
		@animal_species_n = gets.chomp.downcase
		puts "How many toys does the animal have??"
		@animal_toys_n = gets.chomp.downcase
		puts "Who is the owner? Or is it unadopted?"
		@animal_owner_n = gets.chomp.downcase

		if @animal_owner_n == "unadopted"
			new_animal = Animal.new(@animal_name_n, @animal_age_n, @animal_gender_n, @animal_species_n, @animal_toys_n, @animal_owner_n)
			$animals << new_animal
		else	
			client_found = false
			$clients.each do |cli|
				if @animal_owner_n.downcase == cli.name.downcase
					new_animal = Animal.new(@animal_name_n, @animal_age_n, @animal_gender_n, @animal_species_n, @animal_toys_n, @animal_owner_n)
					$animals << new_animal
					client_found = true	
				end
			end
			if client_found == false
				puts "Sorry! The animal doesn't have an owner that is on the system. We'll need to do a background check on them first. Please add them as a new client so our furry friend can have a new home!"
			end
		end

		user_selection_menu = selection_menu 


	when "4"
		system("clear")
		puts "Add a client"
		puts "What is the name of the new client?"
		@client_name_n = gets.chomp.downcase
		puts "What is the gender of this client?"
		@client_gender_n = gets.chomp.downcase
		puts "How many children does this client have?"
		@client_num_children_n = gets.chomp.downcase
		puts "What is the age of this client?"
		@client_age_n = gets.chomp.downcase

		puts "#{@client_name_n.upcase} is a #{@client_age_n}-years-old #{@client_gender_n.downcase} with #{@client_num_children_n} children."

		new_client = Client.new(@client_name_n, @client_gender_n, @client_num_children_n, @client_age_n)
		$clients << new_client

		puts "How many pets does the client currently have?"
		num_of_pets = gets.chomp.to_i

		counter = 0
		for x in 1..num_of_pets do
			puts "What is the animal's name?"
			@animal_name_n = gets.chomp.downcase 
			puts "What is the animal's age?"
			@animal_age_n = gets.chomp.downcase
			puts "What is the animal's gender?"
			@animal_gender_n = gets.chomp.downcase
			puts "What is the animal's species?"
			@animal_species_n = gets.chomp.downcase
			puts "How many toys does the animal have?"
			@animal_toys_n = gets.chomp.downcase
			@animal_owner_n = @client_name_n

			new_animal = Animal.new(@animal_name_n, @animal_age_n, @animal_gender_n, @animal_species_n, @animal_toys_n, @animal_owner_n)
			$animals << new_animal
			puts "#{@animal_name_n.upcase} is a #{@animal_age_n}-year-old #{@animal_gender_n.downcase} #{@animal_species_n.downcase}. It has #{ @animal_toys_n } toy(s). It is owned by #{@animal_owner_n.upcase}."

			counter += 1

		end

		user_selection_menu = selection_menu 

	when "5"
		system("clear")
		puts "Client adopt an animal"



		user_selection_menu = selection_menu 

	when "6"	
		system("clear")
		puts "Client puts an animal up for adoption"



		user_selection_menu = selection_menu 

	else 
		puts "That is not an option! What else would you like to see?"
		user_selection_menu = selection_menu 
	end

end

puts "Woof woof! You just quit the system! Please come back and visit us soon!"
