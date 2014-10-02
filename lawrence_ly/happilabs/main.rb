# require 'pry'
system ('clear')

require_relative './client.rb'
require_relative './class_shelter.rb'
require_relative './animals.rb'

donnie = Animal.new('donnie', 5, 'Male', 'poodle', 'ball')
puts donnie

marco = Client.new('marco',3,55,1)
puts marco

tintin = Animal.new('tintin', 3, 'Male', 'Saint Bernard', 'chew stick' )
puts tintin

$shelter = Shelter.new

$shelter.list_clients << marco
$shelter.list_clients[0].pets << donnie
$shelter.list_animals << tintin

def ask(question)
	puts question
	gets.chomp.downcase
end

def animal_list
	$shelter.list_animals.each do |x|
		puts x.name
	end
end

def client_list
	$shelter.list_clients.each do |y|
		puts y.name 
	end
end

def add_animal
	animal = Animal.new(ask("name?"),ask("age?"),ask("gender?"),ask("species?"),ask("toys?"))
	$shelter.list_animals << animal

	puts ""
	puts "#{ animal.name } was added to the database"
	puts ""
	
end

def add_client
	client = Client.new(ask("name?"),ask("number of children?"),ask("age?"),ask("number of other pets?"))
	$shelter.list_clients << client

	puts ""
	puts "#{ client.name} was added to the database"
	puts ""
	
end

def adopt_animal
	puts "Here is a list of clients"
	client_list
client_answer = ask("what client are you?")

#The ask method/question, the answer that gets returned, gets saved in ruby and needs to be set to variable, so it can be saved. to be called again.
# Find works by saying give me the element in which this condition returns true. Think about what its returning.

found_client = $shelter.list_clients.find { |x| x.name == client_answer }

if found_client == nil
	puts "Your not in the database"
	return # Return means getting out of the function or return value. but we use it to stop running 
else 
	puts "Thanks we found you #{found_client.name}"

	puts "Here is a list of all the animals"

	animal_list

animal_user_input = ask("Which animal would you like to adpot")


animal_chosen = $shelter.list_animals.find { |b| b.name == animal_user_input }

	if animal_chosen == nil
		puts "We dont have that animal in the database, please type the name in properly"
		return
	end
	
	found_client.pets << $shelter.list_animals.delete(animal_chosen)
	# in this line we have pushed the animal into the client while deleting it at the same time! FUCKING GENIUS! THANKS JAMES AND JOEL

	puts ""
	puts "Thank you #{found_client.name} for adopting #{animal_chosen.name}. "
	puts ""


	end
end

	def up_for_adoption
 		member = ask("Are you a member fo this shelter (y/n) ")

 		if member == 'n'
 			puts "Please sign up before we can put your animal up for adoption. "
 			return
 		else
 			puts "Here is a list of our clients. "
			
			client_list

			client_answer = ask("Please state your first name. ")

			found_client = $shelter.list_clients.find { |x| x.name == client_answer }

			if found_client == nil
				puts "Sorry you are not in the database. please sign up or try again. "
				return
			else
				puts ""
				puts "Thanks #{found_client.name} we found you. "
				puts " Please register the animal "
				puts ""
			end
		end
	add_animal
end	

# animal_abandon_name = ask("What is the name of the animal you wish to surrender")

# client_answer.pets{animal_abandon_name}.delete


# animal_abandon = $shelter.list_clients.find { |b| b.name == animal_abandon_name}
# 	if animal_abandon == nil
# 		puts "sorry "
# 	animal_abandon_name.delete

		
# 	end



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
	gets.chomp.downcase
end

menu_option = read_selection
	
until menu_option == 'q'

	case menu_option
	
	when '1'
		animal_list			
	when '2'
		client_list
	when '3'
		add_animal
	when '4'
		add_client
	when '5'
		adopt_animal
	when '6'
		up_for_adoption
		
	end

	menu_option = read_selection

end

		






