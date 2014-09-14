system('clear')

require 'pry'

require_relative './client.rb'
require_relative './animal.rb'

# Seed data
george = Client.new("George", 2, 32)
bill = Client.new("Bill", 3, 38)
claire = Client.new("Claire", 0, 17)

buster = Animal.new("Buster", 8, "male", "dog")
peppa = Animal.new("Peppa", 5, "female", "pig")
felix = Animal.new("Felix", 10, "male", "cat")

buster.toys << "bone" << "ball"
george.pets << buster

$animals = []
$clients = []

$clients << bill << claire << george
$animals << buster << peppa << felix

# Start main program


def display_main_menu

  system('clear')

	puts '  ___ ___                      .__  __         .__.__          '
	puts ' /   |   \_____  ______ ______ |__|/  |______  |__|  |   ______'
	puts '/    ~    \__  \ \____ \\____ \|  \   __\__  \ |  |  |  /  ___/'
	puts '\    Y    // __ \|  |_> >  |_> >  ||  |  / __ \|  |  |__\___ \ '
	puts ' \___|_  /(____  /   __/|   __/|__||__| (____  /__|____/____  >'
	puts '       \/      \/|__|   |__|                 \/             \/  '
  puts ' '
	puts 'MAIN MENU  '
	puts '==========='
	puts '1. Display all animals'
	puts '2. Display all clients'
	puts '3. Create an animal'
	puts '4. Create a client'
	puts '5. Client adopt animal'
	puts '6. Client put animal up for adoption'
	puts 'q. Quit'
  puts ''

end

def read_selection
  display_main_menu
  print "Enter selection: "
  gets.chomp.downcase
end

def display_all_animals
	puts
	unless $animals.length == 0
		$animals.each do |a|
			puts "#{a.name} is a #{a.gender} #{a.species} aged #{a.age} and has #{a.toys.length} toys"
		end
	else
		puts "No animals found."
	end
	gets
end

def display_all_clients
	puts
	unless $clients.length == 0
		$clients.each do |c|
			puts "#{c.name.capitalize}, aged #{c.age}, has #{c.num_children} children and #{c.pets.length} pets."
		end
	else
		puts "No clients found."
	end
	gets
end

def process_menu

	menu_option = read_selection

	until menu_option == 'q'
		case menu_option
		when '1'
			display_all_animals
		when '2'
			display_all_clients
		end

		menu_option = read_selection
	end

end

process_menu

binding.pry