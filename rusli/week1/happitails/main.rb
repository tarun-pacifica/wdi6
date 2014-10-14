system('clear')
require 'pry'

require_relative './animals.rb'
require_relative './client.rb'
require_relative './shelter.rb'

doggy = Animal.new('husky', 8, 'male', 'mamal', 2)
# doggy2 = Animal.new('pepo', 11, 'female', 'mamal', 1)
# doggy3 = Animal.new('lolo', 15, 'female', 'mamal', 1)

cust = Client.new('Jacob', 2, 29, 2)

$responds = Shelter.new
$responds.animal << doggy 
$responds.client << cust


# Call the function 
# List all the menu 
def menu 
	puts "===================="
	puts "        Menu        "
	puts "===================="
	puts "1. List all animals"
	puts "2. List all client"
	puts "3. Add animal"
	puts "4. Create new client" 
	puts "5. Quit"
	puts ''
	puts 'Please enter your selection:'
end 

def read_selection 
	menu
	gets.chomp.downcase
end 


menu_option = read_selection
until menu_option == '5'
	case menu_option
	when '1'
		$responds.animal.each do |animal|
			puts animal
		end
	when '2'
		$responds.client.each do |client|
			puts client
		end
	when '3'
		puts "Please enter name:"
		name = gets.chomp
		puts "Please enter age:"
		age = gets.chomp
		puts "Please enter gender:"
		gender = gets.chomp
		puts "Please enter species:"
		species = gets.chomp
		puts "Please enter toys:"
		toys = gets.chomp

		new_animal = Animal.new(name, age, gender, species, toys)
		$responds.animal.push(new_animal)
		puts "#{ new_animal.name } has been added."

	when '4'
		puts "Please enter your name:"
		name = gets.chomp
		puts "How many children do you have?"
		number_of_child = gets.chomp
		puts "Please enter your age:"
		client_age = gets.chomp
		puts "How many pets do yo have?"
		number_of_pets = gets.chomp
		
		new_client = Client.new(name, number_of_child, client_age, number_of_pets)
		$responds.client.push(new_client)
		puts "#{ new_client.name } has been added."
		
	end

	menu_option =read_selection

end



# 		new_animal = Animal.new(name, age, gender, species, toys) 
# 		Shelter.Animal.push(new_animal) #adds to array.. no matter how many animals have registered
# 		new_client = Client.new(name, number_of_child, client_age, number_of_pets) 
# 		Shelter.Client.push(new_client) #adds to array.. no matter how many clients have registered

# => puts "#{menu_option} is working"
#binding.pry