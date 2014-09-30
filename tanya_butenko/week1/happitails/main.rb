system('clear')

require 'pry'

#calling on other files
require_relative './shelter.rb'
require_relative './animals.rb'
require_relative './clients.rb'

biscuit = Animal.new("Biscuit", 2, "male", "cat")
coco = Animal.new("Coco", 1, "female", "dog")
sushi = Animal.new("Sushi", 1, "female", "fish")

john = Client.new("John Doe", 35, 2, 0)
bob = Client.new("Bob Dylan", 60, 0, "Coco")

shelter = Shelter.new



$shelter = []
$animals = []
$clients = []

$shelter << shelter
$animals << biscuit << coco << sushi
$shelter << $animals
$clients << john << bob
$shelter << $clients
$shelter.first.animal[coco.name] = coco
$shelter.first.animal[biscuit.name] = biscuit
$shelter.first.animal[sushi.name] = sushi
$shelter.first.client[john.name] = john
$shelter.first.client[bob.name] = bob



def main_menu
	puts "Welcome to our animal shelter"
	puts "-----------------------------"
	puts "1. List all animals"
	puts "2. List all clients"
	puts "3. Create an animal"
	puts "4. Create a client"
	puts "5. Adopt an animal"
	puts "6. Put an animal up for adoption"
end

def quit_or_continue_menu
	puts "q. Quit"
	input = gets.chomp
	exit if input == 'q'
	input
end

main_menu
main_menu_option = quit_or_continue_menu

case main_menu_option
when '1'
	puts "Here is a list of all animals: "
	$shelter.each do |shelter|
		shelter.animal.each do |name, animal|
			puts animal
		end
	end
when '2'
	puts "Here is a list of all clients: "
	$shelter.each do |shelter|
		shelter.client.each do |name, client|
			puts client
		end
	end
when '3'
	puts "To add an animal, provide us with further information seperated with comma - name, age, gender, species: "
	i = gets.chomp
	#get input as an array
	info = i.split ', '
	new_animal = Animal.new(info[0], info[1], info[2], info[3])
	$animals << new_animal
	puts "Animal successfully added to the database"
when '4'
	puts "To add a new client provide us with further information seperated with comma - name, age, number of children, pets: "
	i = gets.chomp
	info = i.split ', '
	new_client = Client.new(info[0], info[1], info[2], info [3])
	$clients << new_client
	puts "Client successfully added to the database"
when '5'
when '6'
else
	puts "Please, provide a valid request."
	main_menu
	main_menu_option = quit_or_continue_menu

end

binding.pry








