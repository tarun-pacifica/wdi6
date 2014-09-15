def menu
puts
puts "Welcome!"
puts "________________"
puts
puts "1. Add (+) "
puts "2. Subtraction (-)"
puts "3. Multiplication (x)"
puts "4. Division (%)"
puts "5. Exponents (**)"
puts "6. Square root (>/)"
puts "Q. Quit"
puts
print "Enter your selection: "
end

def read_choice
	menu
	gets.chomp
end

choice = read_choice

until choice.upcase == "Q" 

if choice == "1"
	puts
	puts "Welcome to Addition (+)"
	puts
	puts "What is the first number you wish to add?"
	first_number = gets.to_f
	puts "What is the second number you wish to add?"
	second_number = gets.to_f
	puts "Your answer is #{first_number + second_number}"
	puts
end
	
if choice == "2"
	puts
	puts "Welcome to Subtraction (-)"
	puts
	puts "What is the number you wish to subtract from?"
	first_number = gets.to_f
	puts "How much do you wish to subtract?"
	second_number = gets.to_f
	puts "Your answer is #{first_number - second_number}"
	puts
end


if choice == "3"
	puts
	puts "Welcome to Multiplication (x)"
	puts
	puts "Pick a number"
	first_number = gets.to_f
	puts "How much do you wish to multiply it by?"
	second_number = gets.to_f
	puts "Your answer is #{first_number * second_number}"
	puts
end

if choice == "4"
	puts
	puts "Welcome to Division (%)"
	puts
	puts "Pick a number"
	first_number = gets.to_f
	puts "How much do you wish to divide it by?"
	second_number= gets.to_f
	puts "Your answer is #{first_number / second_number}"
	puts
end

if choice == "5"
	puts
	puts "Welcome to Exponentials (**)"
	puts
	puts "Pick a number"
	first_number = gets.to_f
	puts "... to the power of?"
	second_number= gets.to_f
	puts "Your answer is #{first_number ** second_number}"
	puts
end

if choice == "6"
	puts
	puts "Welcome to Square Root (>/)"
	puts
	puts "Pick a number to find the square root of"
	first_number = gets.to_f
	puts "Your answer is #{Math.sqrt(first_number)}"
	puts
end

if choice != [1,2,3,4,5,6, "q"]
	
end
puts
	puts "Make another choice!"
	puts
choice = read_choice

end



