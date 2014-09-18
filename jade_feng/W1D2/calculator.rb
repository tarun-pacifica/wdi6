## Which calculator do you want?
def menu_root
	puts "1. Basic Calculator"
	puts "2. Advanced Calculator"
	puts "q. Quit"
	print "Which calculator do you want? "
end

def read_calculator_type
	menu_root
	gets.chomp
end

choose_calc = read_calculator_type
puts "You selected Calculator #{choose_calc}!"

## Select the basic calculator	
if choose_calc == "1"
	def menu_basic
		puts "What functionality do you want?"
		puts "1. Addition"
		puts "2. Subtraction"
		puts "3. Multiplication"
		puts "4. Division"
		puts "q. Quit"
		print "Enter your selection: "		# Print so the curser is still at the end of the lime
	end	

	def read_selection_basic
		menu_basic		#calls the menu function
		gets.chomp
	end	

	user_choice = read_selection_basic
	puts "You selected #{user_choice} under basic functionality."

	while user_choice != 'q'
		puts "Let's start calculating!"

		if user_choice == "1"
			print "What is your first number? "
			number1 = gets.to_f
			print "What is your second number? "
			number2 = gets.to_f

			def addition(num1, num2)
				num1 + num2
			end
			puts "The solution is " + addition(number1, number2).to_s + "!"

		elsif user_choice == "2"
			print "What is your first number? "
			number1 = gets.to_f
			print "What is your second number? "
			number2 = gets.to_f

			def subtraction(num1, num2)
				num1 - num2
			end
			puts "The solution is " + subtraction(number1, number2).to_s + "!"

		elsif user_choice == "3"
			print "What is your first number? "
			number1 = gets.to_f
			print "What is your second number? "
			number2 = gets.to_f

			def multiplication(num1, num2)
				num1 * num2
			end	
			puts "The solution is " + multiplication(number1, number2).to_s + "!"

		elsif user_choice == "4"
			print "What is your first number? "
			number1 = gets.to_f
			print "What is your second number? "
			number2 = gets.to_f

			if number2 != 0
				def division(num1, num2)
					num1 / num2
				end
				puts "The solution is " + division(number1, number2).to_s + "!"
			else 
				puts "You can't divide by 0! That's unpossible! ;)"
			end
				
		else
			puts "That wasn't an option!"

		end
		puts "Enter Y when you're ready to try something else! Or anything else if you want to use the same function!"
		calc_more_bas = gets.chomp.downcase
		if calc_more_bas == "y"
			system("clear")
			user_choice = read_selection_basic
		end	
	end

## Choose the complicated calculator!
elsif choose_calc == "2"
	def menu_advanced
		puts "What functionality do you want? "
		puts "1. Indicies"
		puts "2. Square roots"
		puts "3. Logarithms"
		puts "4. Exponentials"
		puts "q. Quit"
		print "Enter your selection:"
	end

	def read_selection_advanced
		menu_advanced
		gets.chomp
	end	

	user_choice_adv = read_selection_advanced
	puts "You just selected #{user_choice_adv} under advanced functionality!"

	while user_choice_adv != "q"
		puts "Let's get calculating! Advanced level!"

		if user_choice_adv == "1"
			print "What is your first number? "
			number1 = gets.to_f
			print "What is your second number? "
			number2 = gets.to_f	

			def indicies(num1, num2)
				num1 ** num2
			end
			puts "The solution is " + indicies(number1, number2).to_s + "!"


		elsif user_choice_adv == "2"
			print "What is your first number? "
			number1 = gets.to_f			
			if number1 < 0
				puts "That's not possible! No imaginary numbers please!"
			else	
				def squareroot(num1)
					Math.sqrt(num1)
				end	
				puts "The solution is " + squareroot(number1).to_s + "!"
			end

		elsif user_choice_adv == "3"
			print "What is your numeric? "
			number1 = gets.to_f
			print "What is your base? "
			number2 = gets.to_f	

			def logarithms(num1, num2)
				if num1 > 0 || num2 >=0
					Math.log(num1,num2)
				else
					puts "Can't calculate that! Revise your log laws!"
				end	
			end
			puts "The solution is " + logarithms(number1, number2).to_s + "!"

		elsif user_choice_adv == "4"
			print "What is your number? "
			number1 = gets.to_f

			def expon(num1)
				Math.exp(num1)
			end
			puts "The solution is " + expon(number1).to_s + "!"

		else
			puts "That wasn't an option!"
		end	

		puts "Enter Y when you're ready to try something else! Or anything else if you want to use the same function!"
		calc_more_adv = gets.chomp.downcase
		if calc_more_adv == "y"
			system("clear")
			user_choice_adv = read_selection_advanced
		end	
	end
end

## Quitting!
puts "You just quit the calculator. Bye!"