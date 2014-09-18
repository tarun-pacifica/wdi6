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

# Add the fcking pets to the pet lists >:(
person1.pets << pet4
person2.pets << pet2



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
	puts "5. Client adopts an animal."
	puts "6. Client offers an animal for adoption."
	puts "7. Change an animal's details."
	puts "8. Change a client's details."
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
	puts "5. All the animals!"
	puts "q. Back to the home menu."
end

def selection_animal
	select_animal
	gets.chomp.downcase
end

def list_the_animal_of_species_unadopted(type_of_animal)
	puts "List all the #{type_of_animal}s."
	$animals.each do |c|
		if c.species == type_of_animal && c.owner == "unadopted"
			puts c
		end
	end
end

def list_the_animal_of_species(type_of_animal)
	puts "List all the #{type_of_animal}s."
	$animals.each do |c|
		if c.species == type_of_animal
			puts c
		end
	end
end


def adopt_an_animal_process
	system("clear")
	puts "Client wants to adopt an animal"
	
	puts "Who is the client that wants to adopt a new furry friend?"
	potential_client_name = gets.chomp.downcase
	
	adopting_client = nil
	$clients.each do |clie|
		if potential_client_name.downcase == clie.name.downcase
			adopting_client = clie
		end
	end

	if adopting_client == nil 
		puts "Sorry! This client doesn't exist on our database. Please go back and include the client so we can help her make a new friend."
		return
	end

	user_selection_animal = selection_animal	
	if user_selection_animal == "q"  		# User chooses animals they want to see.
		return
	end

	case user_selection_animal
		when "1"
			puts "          ,.                 ., "
puts "         ,: ':.    .,.    .:' :, "
puts "         ,',   '.:'   ':.'   ,', "
puts "         : '.  '         '  .' : "
puts "         '.' .,:,.   .,:,. '.' "
puts "          ,:    V '. .' V    :, "
puts "         ,:        / '        :, "
puts "          ,:       =:=       :, "
puts "           ,: ,     :     , :, "
puts "            :' ',.,' ',.,:' ': "
puts "           :'      ':WW::'   '. "
puts "          .:'       '::::'   ': "
puts "        .:'             '.     ',. "
puts "       ,:'               ''     '. "
puts "       .:'               .',    ': "
puts "      .:'               .'.,     : "
puts "      .:                .,''     : "
puts "    .,::'.           .,','     ::::. "
puts "  .:'     ',.       ,:,       ,WWWWW, "
puts "  :'        :       :W:'     :WWWWWWW,       .,.  "
puts "  :         ',      WWW      WWWWWWWWW        '::,  "
puts "  '.         ',     WWW     :WWWWWWWWW         '::, "
puts "   '.         :     WWW     :WWWWWWWW'       	::: "
puts "    '.       ,:     WWW     :WWWWWWW'        .::: "
puts "     .,'   ''::     :W:     :WWWWW.  .,::::'' " 
puts "  ,'        ''','',',','','''WWWWW::::'' "
puts "   ':,,,,,,,':  :  : : :  :  :WWWW''' "
			list_the_animal_of_species_unadopted("cat")
		when "2" 								# Dogs
puts "               ____ "
puts "            ,-'-,  `---._"
puts "     _______(0} `, , ` , )"
puts "     V           ; ` , ` (                            ,'~~~~~~`,   "
puts "     `.____,- '  (,  `  , )                          :`,-'""`. '  "
puts "       `-------._);  ,  ` `,                         ;:      )``:  "
puts "              )  ) ; ` ,,  :                          ``      : ';  "
puts "             (  (`;:  ; ` ;:\                                 ;;;,  "
puts "             (:  )``;:;;)`'`'`- -.    _____     ____       _,-';;`  "
puts "             :`  )`;)`)`'   :    ''~~~     ~~~~~    ~~~`--',.;;;'  "
puts "              (          `  ,  '', '''''',  ''  ''   ''` '',,  ;``  "
puts "               ( ;         ,   `                ;      `; ;  "
puts "               (; ; ;      `                   ,`       ` :  "
puts "                (; /            ;   ;          ` ;     ; :  "
puts "                ;(_; ;  :   ; ; `; ;` ; ; ,,,'''';}     `;  "
puts "                : `; `; `  :  `  `,,;,''''   );;`);     ;  "
puts "                ;' :;   ; : ``'`'           (;` :( ; ,  ;  "
puts "                |, `;; ,``                  `)`; `(; `  `;  "
puts "                ;  ;;  ``:                   `).:` ;,   `.  "
puts "             ,-'   ;`;;:;`                   ;;'`;;  `)   )  "
puts "              ~~~,-`;`;,                             '   ;   "
			list_the_animal_of_species_unadopted("dog")	
		when "3" 								# Birds
puts "           .--. "
puts "          /  6_6 "
puts "          \\  (__\\ "
puts "         //   \\\ "
puts "        ((     )) "
puts "  =======""===""=============== "
puts "           ||| "
puts "           ||| "
puts "           '|' "	
			list_the_animal_of_species_unadopted("bird")

		when "4" 								# Rabbits
puts "              , "
puts "             /|      __  "
puts "            / |   ,-~ /  "
puts "           Y :|  //  / "
puts "           | jj /( .^ "
puts "           >-''-''-v'' "
puts "          /       Y "
puts "         jo  o    | "
puts "        ( ~T~     j "
puts "         >._-' _./ "
puts "        /   ''~''| "
puts "       Y     _,  | "
puts "      /| ;-''~ _  l "
puts "     / l/ ,-''~    \\ "
puts "     \\ //\\ /      .- \\ "
puts "      Y        /    Y  "  
puts "      l       I     ! "
puts "      ]\\      _\\    /\\ "
puts "     ('' ~----( ~   Y.  ) "
puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~ "
			list_the_animal_of_species_unadopted("rabbit")	

		when "5" 								# All the animals
			$animals.each do |x|
				puts x
			end
			type_of_animal = "cat"
		else 
			puts "We don't have that animal on hand! Come back next week and we'll see what we've got!"
			return
	end

	puts "Which furry friend would you like to adopt?"
	adopted_animal_name = gets.chomp.downcase

	# The animal has freaking found itself in the new owner's pet list
	adopted_animal_finally = nil
	$animals.each do |s|
		if s.name.downcase == adopted_animal_name.downcase
			adopted_animal_finally = s 
		end
	end
	if adopted_animal_finally == nil
		puts "Sorry! Your desired new friend doesn't exist on our adoptee list. Please try again with another new companion."
		return
	end

	adopting_client.pets << adopted_animal_finally

	# Change the information about the ownership status of the animal
	adopted_animal_finally.owner = adopting_client.name
	
	puts adopted_animal_finally
	puts adopting_client

end

def client_giving_up_pet
	puts "What is the name of the client who wants to give a pet up for adoption?"
	evil_client_name = gets.chomp.downcase

	client_dumping_pet = nil 		# Check that the client exists
	$clients.each do |clie|
		if evil_client_name.downcase == clie.name.downcase
			client_dumping_pet = clie
		end
	end
	if client_dumping_pet == nil 
		puts "Sorry! This client doesn't exist on our database. Please go back and include the client on the database."
		return
	end		
	
	client_dumping_pet.pets.each do |pet|
		puts pet.name 
	end

	puts "Which pet do you want to abandon in cold-blood?"
	poor_pet_name = gets.chomp.downcase

	poor_pet = nil
	# Change pet's owner to 'unadopted'
	client_dumping_pet.pets.each do |findpet|
		if poor_pet_name.downcase == findpet.name.downcase
			poor_pet = findpet
		end
	end
	if poor_pet == nil
		puts "This pet does not exist. Thank god! Imagine how cruel that would be to dump a pet."
		return
	end
	poor_pet.owner = "unadopted"
	puts "You have now ditched your pet at the pound, #{poor_pet_name.capitalize}."

	# Remove the pet from the client
	client_dumping_pet.pets.delete(poor_pet)

end 

def changing_animal_details
	#List all the animals
	user_selection_animal = selection_animal
	
	unless user_selection_animal == "q"  		# User chooses animals they want to see.
		case user_selection_animal
		when "1"
			puts "          ,.                 ., "
puts "         ,: ':.    .,.    .:' :, "
puts "         ,',   '.:'   ':.'   ,', "
puts "         : '.  '         '  .' : "
puts "         '.' .,:,.   .,:,. '.' "
puts "          ,:    V '. .' V    :, "
puts "         ,:        / '        :, "
puts "          ,:       =:=       :, "
puts "           ,: ,     :     , :, "
puts "            :' ',.,' ',.,:' ': "
puts "           :'      ':WW::'   '. "
puts "          .:'       '::::'   ': "
puts "        .:'             '.     ',. "
puts "       ,:'               ''     '. "
puts "       .:'               .',    ': "
puts "      .:'               .'.,     : "
puts "      .:                .,''     : "
puts "    .,::'.           .,','     ::::. "
puts "  .:'     ',.       ,:,       ,WWWWW, "
puts "  :'        :       :W:'     :WWWWWWW,       .,.  "
puts "  :         ',      WWW      WWWWWWWWW        '::,  "
puts "  '.         ',     WWW     :WWWWWWWWW         '::, "
puts "   '.         :     WWW     :WWWWWWWW'       	::: "
puts "    '.       ,:     WWW     :WWWWWWW'        .::: "
puts "     .,'   ''::     :W:     :WWWWW.  .,::::'' " 
puts "  ,'        ''','',',','','''WWWWW::::'' "
puts "   ':,,,,,,,':  :  : : :  :  :WWWW''' "

			list_the_animal_of_species("cat")	
		when "2" 								# Dogs
puts "               ____ "
puts "            ,-'-,  `---._"
puts "     _______(0} `, , ` , )"
puts "     V           ; ` , ` (                            ,'~~~~~~`,   "
puts "     `.____,- '  (,  `  , )                          :`,-'""`. '  "
puts "       `-------._);  ,  ` `,                         ;:      )``:  "
puts "              )  ) ; ` ,,  :                          ``      : ';  "
puts "             (  (`;:  ; ` ;:\                                 ;;;,  "
puts "             (:  )``;:;;)`'`'`- -.    _____     ____       _,-';;`  "
puts "             :`  )`;)`)`'   :    ''~~~     ~~~~~    ~~~`--',.;;;'  "
puts "              (          `  ,  '', '''''',  ''  ''   ''` '',,  ;``  "
puts "               ( ;         ,   `                ;      `; ;  "
puts "               (; ; ;      `                   ,`       ` :  "
puts "                (; /            ;   ;          ` ;     ; :  "
puts "                ;(_; ;  :   ; ; `; ;` ; ; ,,,'''';}     `;  "
puts "                : `; `; `  :  `  `,,;,''''   );;`);     ;  "
puts "                ;' :;   ; : ``'`'           (;` :( ; ,  ;  "
puts "                |, `;; ,``                  `)`; `(; `  `;  "
puts "                ;  ;;  ``:                   `).:` ;,   `.  "
puts "             ,-'   ;`;;:;`                   ;;'`;;  `)   )  "
puts "              ~~~,-`;`;,                             '   ;   "

			list_the_animal_of_species("dog")	
		when "3" 								# Birds
puts "           .--. "
puts "          /  6_6 "
puts "          \\  (__\\ "
puts "         //   \\\ "
puts "        ((     )) "
puts "  =======""===""=============== "
puts "           ||| "
puts "           ||| "
puts "           '|' "


			list_the_animal_of_species("bird")	
		when "4" 								# Rabbits

puts "              , "
puts "             /|      __  "
puts "            / |   ,-~ /  "
puts "           Y :|  //  / "
puts "           | jj /( .^ "
puts "           >-''-''-v'' "
puts "          /       Y "
puts "         jo  o    | "
puts "        ( ~T~     j "
puts "         >._-' _./ "
puts "        /   ''~''| "
puts "       Y     _,  | "
puts "      /| ;-''~ _  l "
puts "     / l/ ,-''~    \\ "
puts "     \\ //\\ /      .- \\ "
puts "      Y        /    Y  "  
puts "      l       I     ! "
puts "      ]\\      _\\    /\\ "
puts "     ('' ~----( ~   Y.  ) "
puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~ "

			list_the_animal_of_species("rabbit")	
		when "5" 								# All the animals
			$animals.each do |x|
				puts x
			end
		else 
			puts "We don't have that animal on hand! Come back next week and we'll see what we've got!"
		end			 	
	end 
	puts "Which animal's details do you want to change?"
	animal_name = gets.chomp.downcase

	animal_to_change = nil
	$animals.each do |n|
		if animal_name.downcase == n.name.downcase
			animal_to_change = n
		end 
	end
	if animal_to_change == nil
		puts "This animal does not exist!"
		return
	end

	# Start asking questions!
	puts "What is the animal's current name?"
	animal_to_change.name = gets.chomp.downcase 
	puts "What is the animal's current age?"
	animal_to_change.age = gets.chomp.downcase
	puts "What is the animal's current gender?"
	animal_to_change.gender = gets.chomp.downcase
	puts "What is the animal's current species?"
	animal_to_change.species = gets.chomp.downcase
	puts "How many toys does the animal now have?"
	animal_to_change.toys = gets.chomp.downcase
	
	puts animal_to_change.to_s 	#Calling out the new details of the animal
end 

def changing_client_details
	#List all the clients
	$clients.each do |c|
		puts c
	end	

	puts "Which client's details do you want to change?"
	client_name = gets.chomp.downcase

	client_to_change = nil
	$clients.each do |n|
		if client_name.downcase == n.name.downcase
			client_to_change = n
		end 
	end
	if client_to_change == nil
		puts "This client does not exist!"
		return
	end

	# Start asking questions!
	puts "What is the client's current name?"
	client_to_change.name = gets.chomp.downcase 
	puts "What is the client's current age?"
	client_to_change.age = gets.chomp.downcase
	puts "What is the client's current gender?"
	client_to_change.gender = gets.chomp.downcase
	puts "What is the client's current number of children?"
	client_to_change.num_children = gets.chomp.downcase
	
	puts client_to_change.to_s 	#Calling out the new details of the client
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

			puts "          ,.                 ., "
puts "         ,: ':.    .,.    .:' :, "
puts "         ,',   '.:'   ':.'   ,', "
puts "         : '.  '         '  .' : "
puts "         '.' .,:,.   .,:,. '.' "
puts "          ,:    V '. .' V    :, "
puts "         ,:        / '        :, "
puts "          ,:       =:=       :, "
puts "           ,: ,     :     , :, "
puts "            :' ',.,' ',.,:' ': "
puts "           :'      ':WW::'   '. "
puts "          .:'       '::::'   ': "
puts "        .:'             '.     ',. "
puts "       ,:'               ''     '. "
puts "       .:'               .',    ': "
puts "      .:'               .'.,     : "
puts "      .:                .,''     : "
puts "    .,::'.           .,','     ::::. "
puts "  .:'     ',.       ,:,       ,WWWWW, "
puts "  :'        :       :W:'     :WWWWWWW,       .,.  "
puts "  :         ',      WWW      WWWWWWWWW        '::,  "
puts "  '.         ',     WWW     :WWWWWWWWW         '::, "
puts "   '.         :     WWW     :WWWWWWWW'       	::: "
puts "    '.       ,:     WWW     :WWWWWWW'        .::: "
puts "     .,'   ''::     :W:     :WWWWW.  .,::::'' " 
puts "  ,'        ''','',',','','''WWWWW::::'' "
puts "   ':,,,,,,,':  :  : : :  :  :WWWW''' "

			list_the_animal_of_species_unadopted("cat")	
		when "2" 								# Dogs
puts "               ____ "
puts "            ,-'-,  `---._"
puts "     _______(0} `, , ` , )"
puts "     V           ; ` , ` (                            ,'~~~~~~`,   "
puts "     `.____,- '  (,  `  , )                          :`,-'""`. '  "
puts "       `-------._);  ,  ` `,                         ;:      )``:  "
puts "              )  ) ; ` ,,  :                          ``      : ';  "
puts "             (  (`;:  ; ` ;:\                                 ;;;,  "
puts "             (:  )``;:;;)`'`'`- -.    _____     ____       _,-';;`  "
puts "             :`  )`;)`)`'   :    ''~~~     ~~~~~    ~~~`--',.;;;'  "
puts "              (          `  ,  '', '''''',  ''  ''   ''` '',,  ;``  "
puts "               ( ;         ,   `                ;      `; ;  "
puts "               (; ; ;      `                   ,`       ` :  "
puts "                (; /            ;   ;          ` ;     ; :  "
puts "                ;(_; ;  :   ; ; `; ;` ; ; ,,,'''';}     `;  "
puts "                : `; `; `  :  `  `,,;,''''   );;`);     ;  "
puts "                ;' :;   ; : ``'`'           (;` :( ; ,  ;  "
puts "                |, `;; ,``                  `)`; `(; `  `;  "
puts "                ;  ;;  ``:                   `).:` ;,   `.  "
puts "             ,-'   ;`;;:;`                   ;;'`;;  `)   )  "
puts "              ~~~,-`;`;,                             '   ;   "

			list_the_animal_of_species_unadopted("dog")	
		when "3" 								# Birds
puts "           .--. "
puts "          /  6_6 "
puts "          \\  (__\\ "
puts "         //   \\\ "
puts "        ((     )) "
puts "  =======""===""=============== "
puts "           ||| "
puts "           ||| "
puts "           '|' "


			list_the_animal_of_species_unadopted("bird")	
		when "4" 								# Rabbits

puts "              , "
puts "             /|      __  "
puts "            / |   ,-~ /  "
puts "           Y :|  //  / "
puts "           | jj /( .^ "
puts "           >-''-''-v'' "
puts "          /       Y "
puts "         jo  o    | "
puts "        ( ~T~     j "
puts "         >._-' _./ "
puts "        /   ''~''| "
puts "       Y     _,  | "
puts "      /| ;-''~ _  l "
puts "     / l/ ,-''~    \\ "
puts "     \\ //\\ /      .- \\ "
puts "      Y        /    Y  "  
puts "      l       I     ! "
puts "      ]\\      _\\    /\\ "
puts "     ('' ~----( ~   Y.  ) "
puts " ~~~~~~~~~~~~~~~~~~~~~~~~~~ "

				list_the_animal_of_species_unadopted("rabbit")	
			when "5" 								# All the animals
				$animals.each do |x|
					if x.owner == "unadopted"
						puts x.to_s
					end
				end
			else 
				puts "We don't have that animal on hand! Come back next week and we'll see what we've got!"
			end			 	
		end 

		user_selection_menu = selection_menu 

	when "2"
		system("clear")

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
		puts "How many toys does the animal have?"
		@animal_toys_n = gets.chomp.downcase
		@animal_owner_n = "unadopted"

		new_animal = Animal.new(@animal_name_n, @animal_age_n, @animal_gender_n, @animal_species_n, @animal_toys_n, @animal_owner_n)
		$animals << new_animal
		
		puts new_animal.to_s

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


		# counter = 0
		# for x in 1..@client_age_n do
		# 	puts "What is the animal's name?"
		# 	@animal_name_n = gets.chomp.downcase 
		# 	puts "What is the animal's age?"
		# 	@animal_age_n = gets.chomp.downcase
		# 	puts "What is the animal's gender?"
		# 	@animal_gender_n = gets.chomp.downcase
		# 	puts "What is the animal's species?"
		# 	@animal_species_n = gets.chomp.downcase
		# 	puts "How many toys does the animal have?"
		# 	@animal_toys_n = gets.chomp.downcase
		# 	@animal_owner_n = @client_name_n

		# 	new_animal = Animal.new(@animal_name_n, @animal_age_n, @animal_gender_n, @animal_species_n, @animal_toys_n, @animal_owner_n)
		# 	$animals << new_animal
		# 	puts "#{@animal_name_n.upcase} is a #{@animal_age_n}-year-old #{@animal_gender_n.downcase} #{@animal_species_n.downcase}. It has #{ @animal_toys_n } toy(s). It is owned by #{@animal_owner_n.upcase}."

		# 	counter += 1

		# end

		user_selection_menu = selection_menu 

	when "5"
		system("clear")

		 # client adopts an animal
		adopt_an_animal_process  	#CAN'T TOUCH THIS. DAN DANDAN DAN. DANDAN. DANDAN. Can't touch this. 
		user_selection_menu = selection_menu 

	when "6"	
		system("clear")
		# "Client puts an animal up for adoption"

		client_giving_up_pet 	#Don't touch this either

		user_selection_menu = selection_menu 
	when "7"
		system("clear")

		# change the animal's details
		changing_animal_details
		user_selection_menu = selection_menu 

	when "8"
		system("clear")

		# change the client's details
		changing_client_details
		user_selection_menu = selection_menu 

	else 
		system("clear")
		puts "That is not an option! What would you like to see?"
		user_selection_menu = selection_menu 
	end

end
 
system("clear")
puts "Woof woof! You just quit the system! Please come back and visit us soon!"

puts "                       ,ood8888booo, "
puts "                    ,oda8a888a888888bo,  "
puts "                 ,od88888888aa888aa88a8bo,  "
puts "               ,da8888aaaa88a888aaaa8a8a88b,  "
puts "              ,oa888aaaa8aa8888aaa8aa8a8a88o,  "
puts "             ,88888aaaaaa8aa8888a8aa8aa888a88, "
puts "             8888a88aaaaaa8a88aa8888888a888888 "
puts "             888aaaa88aa8aaaa8888; ;8888a88888 "
puts "             Y888a888a888a8888;'   ;888888a88Y "
puts "              Y8a8aa8a888a88'      ,8aaa8888Y "
puts "               Y8a8aa8aa8888;     ;8a8aaa88Y "
puts "                `Y88aa8888;'      ;8aaa88Y' "
puts "        ,,;;;;;;;;'''''''         ;8888Y' "
puts "     ,,;                         ,888P "
puts "   ,;  ,;,                      ;"" "
puts "  ;       ;          ,    ,    ,; "
puts " ;  ;,    ;     ,;;;;;   ;,,,  ; "
puts ";  ; ;  ,' ;  ,;      ;  ;   ;  ; "
puts "; ;  ; ;  ;  '        ; ,'    ;  ; "
puts "`;'  ; ;  '; ;,       ; ;      ; ', "
puts "     ;  ;,  ;,;       ;  ;,     ;;; "
puts "      ;,,;             ;,,; "