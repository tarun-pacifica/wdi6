 
## GET SELECTION 
## PROCESS SELECTION
## GET NUMBERS
## DO CALCULATION 
## DISPLAY RESULT 

## FUNCTIONS 


def add
	a + b
end

def subtract
	a - b
end

def multiply

end

def divide

end 





def read_selection 
	print "Enter your selection:"
	input = gets.chomp.downcase 
	exit if input == "q" 
	return input
end 


## DISPLAY MENU 
def menu 
	puts "1. Add"
	puts "2. Subract"
	puts "3. Multiply"
	puts "4. Divide"
	puts "q. Quit"
	user_choice = read_selection

    # ASK USER FOR NUMBER 1
    
    print "Please enter first number:"
    a = gets.to_i
    # ASK USER FOR NUMBER 2 
    print "Please enter second number:"
    b = gets.to_i

	case user_choice
	when "1" 
		#puts add(1,1)
		puts "Result is #{ add }"
	when "2" 
		#puts subtract(5,3)
		puts "Result is #{ subtract }"
	when "3"
		puts "crazy"
	end 

end 


menu 




# def input
# 	print "Enter your first number:"
# 	num1 = gets.to_i
# 	print "Enter your second number:"
# 	num2 = gets.to_i
# end


# def sum
# 	result = num1 + num2
# end

# def subtract 
# 	result = num1 - num2
# end

# case user_choice 
# 	when'1'
# 	total =
# 	puts "Result #{result}"
# 	else '2' 
# 	total = subtract
# 	puts "result is #{result}"
# end
  
	

	

# until user_choice == "q"
# read_selection = input









# # until 
# # def addition  
# # 	puts "please enter the first number:"
# # 	num1 = gets.to_i
# # 	puts "please enter the second number:"
# # 	num2 = gets.to_i
# # 	answer = num1 + num2
# # 	puts "the answer is #{answer}"
# # 	result
# # end 
 

# # if menu == '1'
# # 	result = addition 
# # 	puts "the answer is #{answer}"
# # else 
# # 	puts "no no"
# # end

# # def name_tag
# # 	if menu == "1"
# # 	elsif menu == "2" 
# # 		puts "please enter first number:"
# # 		num1 = gets.to_i
# # 		puts "please enter second number:"
# # 		num2 = gets.to_i
# # 		answer = num1 + num2
# # 		puts "the answer is #{answer}"
# # 		puts "wrong answer"
# # 	end 
# # end 
		
# # name_tag 
# num1 = gets.to_i
# num2 = gets.to_i


# def sum
# 		puts "please enter first number:"
# 		num1 = gets.to_i
# 		puts "please enter second number:"
# 		num2 = gets.to_i
# 		answer = num1 + num2
# 		puts "the answer is #{answer}"
# end
# sum

# def subtract
# 		puts "please enter first number:"
# 		num1 = gets.to_i
# 		puts "please enter second number:"
# 		num2 = gets.to_i
# 		answer = num1 - num2
# 		puts "the answer is #{answer}"
# end

# subtract

# def multiply
# 		puts "please enter first number:"
# 		num1 = gets.to_i
# 		puts "please enter second number:"
# 		num2 = gets.to_i
# 		answer = num1 * num2
# 		puts "the answer is #{answer}"
# end

# multiply
 
# until user_choice == "q"
	

# # def add_calc 
# # 	puts "please enter the number:"
# # 	a = gets.chomp
# # 	puts "please enter the no:"
# # 	b = gets.chomp
# # 	a + b = answer
# # 	print "the result is #{answer}"
# # end 

# # read_selection = add_calc

# # def read_selection
# # 	menu 
# # 	gets.chomp
# # end 






















# # def addition_function
# #     puts "Which numbers would you like to add?"
# #     @n1 = gets.chomp
# #     @n2 = gets.chomp
# #     @n1 + @n2 == @answer
# #     puts "The sum is... #{@answer}"
# # end

# # def subtraction_function
# #     puts "Which numbers would you like to subtract?"
# #     @n1 = gets.chomp.to_i
# #     @n2 = gets.chomp.to_i
# #     @n1 - @n2 == @answer
# #     puts "The answer is... #{@answer}"
# # end

# # def multiplication_function
# # puts "Which numbers would you like to multiply?"
# #     @n1 = gets.chomp
# #     @n2 = gets.chomp
# #     @n1 * @n2 == @answer
# #     puts "The answer is... #{@answer}"
# # end

# # puts "Would you like to [add], [multiply], or [subtract]?"
# # response = gets.chomp
# # if response == "add" then
# #     addition_function
# # end
# # if response == "subtract" then
# #     subtraction_function
# # end
# # if response == "multiply" then
# #     multiplication_function
# # end