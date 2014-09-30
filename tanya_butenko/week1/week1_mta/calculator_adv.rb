#calculator with few functions
#with menu that let's to choose the function
#and the mode of calculator

#propose user choice of calculator modes
def main_menu
	puts "1. Basic"
	puts "2. Advanced"
	print "Whitch mode of calculator you prefer: "
end

#gets the user's input
def read_mode_selection
	main_menu
	gets.chomp.downcase
end

user_mode_choice = read_mode_selection

#checks what mode user selected and gives the menu in acordance 
if user_mode_choice == '1'
	def basic_menu
		puts "1. Add"
		puts "2. Subtract"
		puts "3. Divide"
		puts "4. Multiply"
		puts "q. Quit"
		print "Enter your selection: "
	end
	def read_selection
		basic_menu
		gets.chomp.downcase
	end

else
	def adv_menu
		puts "1. Add"
		puts "2. Subtract"
		puts "3. Divide"
		puts "4. Multiply"
		puts "5. Exponent"
		puts "6. Square root"
		puts "q. Quit"
		print "Enter your selection: "
	end
	def read_selection
		adv_menu
		gets.chomp.downcase
	end

end

user_choice = read_selection


#loop that calculate according to the user choice if user didn't choose 'q'
while user_choice != 'q'

	print "What is the first number: "
	num1 = gets.to_i

	print "What is the second number: "
	num2 = gets.to_i

	def math(choice, n1, n2)
		case choice
			when '1'
				n1 + n2
			when '2'
				n1 - n2
			when '3'
				n1 / n2
			when '4'
				n1 * n2
			when '5'
				n1 ** n2
			when '6'
				Math.sqrt(n1)
		end
	end
	
	result = math(user_choice, num1, num2)
	puts "The result is: #{ result }"

	user_choice = read_selection
end




