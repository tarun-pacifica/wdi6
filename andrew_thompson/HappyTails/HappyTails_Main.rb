# Opens my code using Pry in Terminal.
require 'pry'
require_relative './animal.rb'
require_relative './client.rb'
require_relative './adoptions.rb'

# Clears the Terminal screen before running my program.
system('clear')

# Method defining the Happy Tails main menu
def main_menu
  puts "Welcome to Happy Tails animal shelter!"
  puts "To display a list of animals available for adoption, please press 1"
  puts "To display a list of current clients, please press 2"
  puts "To add a new animal to the Happy Tails database, please press 3"
  puts "To add a new client to the Happy Tails database, please press 4"
  puts "To process an adoption, press 5"
  puts "To put a new animal up for adoption, please press 6"
  puts "Press Q to quit"
end

# This method captures the user selection from the main menu.
def read_selection
  main_menu
  gets.chomp.downcase
end

# Stores information about animals collected using the Animals class in an array. The '$' changes the variable 
# Animals into a Global Variable i.e. it can access data from within a method. This normally can't be done. 
$animals = []
$clients = []
$adoptions = []

# Here I forced a few animals into the $animals array
$animals.push Animal.new('Hudson', '5', 'male', 'Dog', 'Purple Rhino')
$animals.push Animal.new('Kaiser', '9', 'male', 'Dog', 'Rope Toy')
$animals.push Animal.new('Fido', '7', 'male', 'Dog', 'Tennis Ball')

# Here I forced a few clients into the $clients array
$clients.push Client.new('John', 'Smith', '2', '27', 'male', '2')
$clients.push Client.new('Andrew', 'Thompson', '0', '32', 'male', '1')
$clients.push Client.new('Mike', 'Jones', '1', '40', 'male', '4')


# This method takes the user selection from the main menu and stores it as the variable, menu_option
menu_option = read_selection

until menu_option == 'q'

  case menu_option

    when '1'
      # Prints  list of animals available for adoption.
      $animals.each do |x|
        print x.to_s
    end   
    screen('clear')
    menu_option = read_selection

    when '2'
    	# Prints a list of current clients.
    	$clients.each do |x|
        print x.to_s
    end

    menu_option = read_selection

    when '3'
      # Adds a new animal to the $animals array
      puts "Please enter animal name"
      name = gets.chomp.downcase
      
      puts "Please enter the age of the animal"
      age = gets.chomp.downcase

      puts "Please enter the gender of the animal"
      gender = gets.chomp.downcase

      puts "Please enter the animal species"
      species = gets.chomp.downcase

      puts "Please enter the animal's favourite toy"
      toy = gets.chomp.downcase

      $animals << ['name', 'age', 'gender', 'species', 'toy']


   

    when '4'
      # Adds a new cient to the $client arrary
      puts "Please enter client's first name"
        first_name = gets.chomp.downcase

      puts "Please enter client's last name"
        last_name = gets.chomp.downcase

      puts "Please enter number of children"
        number_children = gets.chomp.downcase

      puts "Please enter client's age"
        client_age = gets.chomp.downcase

      puts "Please enter client's gender"
        client_gender = gets.chomp.downcase

      puts "How many pets does the new client have?"
        number_pets = gets.chomp.downcase

      puts " Thank you for entering a new client to the Happy Tails shelter database!"


    when '5'
      # Process an adoption
      puts "Please select pet to be adopted:"
        # Prints  list of animals available for adoption.
        $animals.each do |x|
        print x.to_s
      end


      # puts "Please select a client:"
      #   adoptee = gets.chomp.downcase

    #   puts 

    # else
    #   puts " I'm sorry, I don't recognise your selection"
    
    else
      puts " I'm sorry, I don't recognise your selection"

      menu_option = read_selection
end



 

end


binding.pry