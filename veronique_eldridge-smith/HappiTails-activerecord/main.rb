require 'pry'
require 'active_record'

# ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'happitails.db'
)

require_relative 'shelters' 
require_relative 'clients'
require_relative 'animals'


##########################****** MAIN MENU ********###########################

def main_menu
	puts "Welcome to *** HAPPITAILS *** Animal Shelter!"
	puts "1. Display all animals"
	puts "2. Display all clients"
	puts "3. Create an animal"
	puts "4. Create a client"
	puts "5. Facilitate animal adoption by existing client"  # give a pet to a client
	puts "6. Put an animal up for adpotion"  # accept a pet from a client
	puts "q. Quit"
end

#**************************#####*******######*******************************#

main_menu
main_menu_option = gets.chomp.downcase


until main_menu_option == 'q'
	case main_menu_option

	##########################****** LIST ANIMALS ********###########################

	when '1'
		Animal.where(:client_id => nil).each do |animal|
			puts animal
		end


	##########################****** LIST CLIENTS ********#########################

	when '2'
		Client.all.each do |client|
			puts client
		end

	##########################****** CREATE ANIMALS ********#########################

	when '3'
		animal = Animal.new
		puts "What is the animal's name?"
		animal.name = gets.chomp
		puts "What is the animal's age?"
		animal.age = gets.to_i
		puts "What is the animal's gender?"
		animal.gender = gets.chomp
		puts "What is the animal's species?"
		animal.species = gets.chomp
		animal.save

		puts animal

		

	##########################****** CREATE CLIENT ********#########################	

	when '4'
		client = Client.new
		puts "What is the clients's name?"
		client.name = gets.chomp
		puts "How many children does he/she have?"
		client.children = gets.to_i
		puts "What is the client's age?"
		client.age = gets.chomp
	
		client.save
		puts client

	################****** FACILITATE ANIMAL ADOPTION BY EXISTING CLIENT ********###############

	when '5'
		print "Enter the name of the client who is adopting an animal: "
		client = Client.find_by_name(gets.chomp)
		print "Enter the name of the animal he/she would like to adopt: "
		animal = Animal.where(:name => gets.chomp)
		client.animals << animal
		client.save


	################****** PUT ANIMAL UP FOR ADOPTION ********###############

	when '6' 
		print "What is the name of the client who is rejecting the pet: "
		client = Client.find_by :name => gets.chomp
		print "What is the name of the pet: "
		animal = Animal.find_by :name => gets.chomp
		animal.client_id = nil
		animal.save

		
	end
	main_menu
	main_menu_option = gets.chomp.downcase
end

# binding.pry

