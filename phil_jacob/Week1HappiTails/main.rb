require 'pry'

require_relative './shelter.rb'
require_relative './client.rb'
require_relative './animal.rb'




#Seed animals
leonardo = Animal.new('Leonardo', 23, 'Male', 'Mutant Ninja Turtle', 'Sword')
raphael = Animal.new('Raphael', 24, 'Male', 'Mutant Ninja Turtle', 'Twin Sai')
donatello = Animal.new('Donatello', 25, 'Male', 'Mutant Ninja Tutle', 'Bo Staff')
michaelangelo = Animal.new('Michaelangelo', 26, 'Male', 'Mutant Ninja Turtle', 'Nunchuck')


# [leonardo, raphael, donatello, michaelangelo].each do |animal|
#   h.available_animals[animal.name.downcase.sub(' ', '').to_sym] = animal
# end
$h = Shelter.new

$h.available_animals << leonardo << raphael << donatello << michaelangelo

# puts $h.available_animals

#Seed client
splinter = Client.new('Splinter', 60, 'Male', 0, 0)

# [splinter].each do |client|
#   h.clients[client.name.downcase.to_sym] = client
# end

$h.clients << splinter

# Instantiate a Shelter 


# Seed data

# shelter.animals << leonardo << raphael << donatello << michaelangelo 
# shelter.clients << splinter

# binding.pry

def list_animals
	$h.available_animals.each do |a|
		puts a
		puts
	end
end


def menu
	puts 
 	puts "Welcome to HappiTails Animal Shelter!"
 	puts
	puts "Please choose from one of the options below:"
	puts 
	puts "(1) List all animals up for adoption" 
	puts "(2) List all shelter clients" 
	puts "(3) Adopt an animal" 
	puts "(4) Return an animal"  
	puts "(q) Quit "
	puts
	puts "Please enter your selection: "
	gets.chomp.downcase
end

response = menu

 
until response.downcase == 'q'

	case response
	 	when '1'
	 		list_animals
	 		# .keys.join(", ")}.
	    	# puts "Press enter to return to the menu"
	    when '2'
	 	 	puts "Our clients are #{h.clients.keys.join(", ")}."
	    	puts "Press enter to return to the menu"
	  when '3'
	    	puts "Which client are you?"
	   		puts shelter.clients.keys.join(", ")
	    	client_name = gets.chomp.downcase.to_sym
	     		 if h.clients.keys.include? client_name
	            	while true
	              		if (h.available_animals.keys.size) < 1
	                 		 puts "No more pets to adopt!"
	                  		 break
	                	end
	              puts "What pet would you like to adopt?"
	              puts h.available_animals.keys.join(", ")
	              adopt_pet = gets.chomp.downcase.to_sym
	                if h.available_animals.keys.include? adopt_pet
	                  h.do_adopt (client_name), (adopt_pet)
	                  puts "You have now adopted a pet!"
	                  puts "Press enter to return to the menu"
	                  break
	               else
	                  puts "You can't adopt a pet that doesn't exist!"
	              end
	            end
	      else
	        puts "Sorry you are not one of our clients! Press enter to return to menu."
	        response
	      end
	  when '4'
	    puts "Which client are you?"
	    puts h.clients.keys.join(", ")
	    client_name = gets.chomp.downcase.to_sym
	    if h.clients.keys.include? client_name
	      if h.clients[client_name].pets.keys.empty?
	        puts "You have no pets to abandon! Press enter to return to menu."
	        response
	      else
	        while true
	            puts "What pet would you like to abandon?"
	            puts h.clients[client_name].pets.keys.join(", ")
	              abandon_pet = gets.chomp.downcase.to_sym
	              if h.clients[client_name].pets.keys.include? abandon_pet
	                  h.receive_abandon (client_name.to_sym), (abandon_pet)
	                  puts "You have now abandoned a pet :("
	                  puts "Press enter to return to the menu"
	                  break
	              else
	                puts "You can't abandon a pet that you don't have!"
	              end
	        end
	      end
	    else puts "Sorry you are not one of our clients! Press enter to return to menu."
	    end
	 else
	    puts 'Please enter one of the selections.'
	  end


  # gets
  response = menu

end


 

 