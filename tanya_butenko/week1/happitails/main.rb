system('clear')

require 'pry'

#calling on other files
require_relative './shelter.rb'
require_relative './animals.rb'
require_relative './clients.rb'

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
	









