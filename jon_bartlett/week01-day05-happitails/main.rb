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
#george.pets << buster << peppa
claire.pets << felix

$animals = []
$clients = []

$clients << bill << claire << george
$animals << buster << peppa << felix 

# Start main program

def display_header
  system('clear')
	puts '  ___ ___                      .__  __         .__.__          '
	puts ' /   |   \_____  ______ ______ |__|/  |______  |__|  |   ______'
	puts '/    ~    \__  \ \____ \\____ \|  \   __\__  \ |  |  |  /  ___/'
	puts '\    Y    // __ \|  |_> >  |_> >  ||  |  / __ \|  |  |__\___ \ '
	puts ' \___|_  /(____  /   __/|   __/|__||__| (____  /__|____/____  >'
	puts '       \/      \/|__|   |__|                 \/             \/  '
  puts ' '
end

def display_main_menu
	display_header
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
	display_header
	puts "LIST ALL ANIMALS"
	puts "================"
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
	display_header
	puts "LIST ALL CLIENTS"
	puts "================"
	puts
	unless $clients.length == 0
		$clients.each do |c|
			puts "#{c.name.capitalize}, aged #{c.age}, has #{c.num_children} children and #{c.pets.length} pets:"

			unless c.pets.length == 0
				c.pets.each do |p|
					puts "   #{p.name}"
				end
			end

		end
	else
		puts "No clients found."
	end
	gets
end

def create_animal
  display_header
  puts "CREATE ANIMAL"
  puts "============="
  print "Enter name: "
  animal_name = gets.chomp
  print "Enter age: "
  animal_age = gets.chomp
  print "Enter gender: "
  animal_gender = gets.chomp
  print "Enter species: "
  animal_species = gets.chomp
  print "Enter toys [if more than one, separate with spaces] :"
  animal_toys = gets.chomp
  new_animal = Animal.new(animal_name, animal_age, animal_gender, animal_species)
  new_animal.toys = animal_toys.split(' ')
  $animals.push new_animal
  puts ""
  puts "Animal created"
  gets
end

def create_client
  display_header
  puts "CREATE CLIENT"
  puts "============="
  print "Enter name: "
  client_name = gets.chomp
  print "Enter age: "
  client_age = gets.chomp
  print "Enter number of children: "
  client_num_children = gets.chomp
  $clients.push Client.new(client_name, client_num_children, client_age)
  puts ""
  puts "Client created"
  gets
end

def animal_exist? (name)

  exists = false

  $animals.each do |a|
    if a.name == name
      exists = true
  	end
  end
  exists
end

def client_exists? (name)

	exists = false

	$clients.each do |c|
		if c.name == name
			exists = true
		end
	end
  exists
end

# Fetch Animals that are not assigned to Clients
def get_adoptable_animals
	adoptable_animals = []

  adoptable_animals = $animals.select {|a| 
  	adoptable_animal = true
    $clients.each do |c|
    	c.pets.each do |p|
    		if a == p 
          adoptable_animal = false
    		end
    	end
    end	
    adoptable_animal
  }
  
  adoptable_animals
end



def adopt_animal
  adoptable_animals = [] 
  display_header

  puts "ADOPT ANIMAL"
  puts "============="
  adoptable_animals = get_adoptable_animals

  unless adoptable_animals == 0
  	puts "The following animals are available for adoption: "
  	puts
    
    adoptable_animals.each do |a|
    	puts " " + a.name
    end

    puts
	  print "Enter animal name: "
	  animal_name = gets.chomp 
	  puts 
	  # check user input
	  if animal_exist?(animal_name)
	  	puts "The following clients are availabe to adopt: "

	  	$clients.each do |c|
	  		puts " " + c.name
	  	end

	  	puts
		  print "Enter client name: "
	 	 	client_name = gets.chomp

		  unless client_exists?(client_name).nil?
		  	# assign pet to client		  	
		  	$clients.select {|c| c.name == client_name }.first.pets.push($animals.select {|a| a.name == animal_name}.first)
		  	puts
		  	puts "Records updated to show that #{client_name} has adopted #{animal_name}"
		  else
		  	puts
		  	puts "Client name does exist."
		  end

	 	else
	 		puts
	 	  puts "Animal name does not exist." 	
	  end
  else
  	puts "No animals are currently available to adopt."
  end
  gets
end


def animal_for_adoption
  adoptable_animals = [] 
  display_header

  puts "CLIENT PUT ANIMAL UP FOR ADOPTION"
  puts "================================="
  puts ""
  puts "The following Animals are adopted by the following Clients"
  $clients.select {|c| c.pets.length > 0}.each do |a| 
  	puts " #{a.name}"
  end

  print "Enter Client name: "
  client_name = gets.chomp
  puts
  print "Enter name of Animal to put up for adoption: "
  animal_name = gets.chomp

end

def process_menu

	menu_option = read_selection
	until menu_option == 'q'
		case menu_option
		when '1'
			display_all_animals
		when '2'
			display_all_clients
		when '3'
			create_animal
		when '4'
			create_client
		when '5'
			adopt_animal
		end
		menu_option = read_selection
	end
end

process_menu

binding.pry