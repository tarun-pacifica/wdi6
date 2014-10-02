system ("clear")


## start menu 

def menu
	puts "Line N"
	puts "Line L"
	puts "Line 6"
	print "Please choose a line where you would like to travel"
end

## the origin where you are

def origin
	menu
	user_choice = gets.chomp
	puts "You have selected #{ user_choice }"
	user_choice 
end

user_choice = origin


if user_choice == 'N'
	puts "This is Line N. The stations are: 8th, Times Square, Union Square, 23rd, 34th"

elsif user_choice == 'L'
	puts "This is Line L"


elsif user_choice == 'L' 
	puts "This is Line 6"

else 
	puts "This is not a correct line"
end

###
def leaving
	origin
	user_choice = gets.chomp
	puts "You are leaving from #{user_choice}"
end


# if user_choice == "8th_1"
# 	puts "You have selected 8th"
# elsif user_choice == "times sqaure"
# 	puts "You have selected times square"
# elsif user_choice == "union square"
# 	puts "You have selected union square"
# elsif user_choice == "23rd"
# 	puts "You have selected 23rd"
# elsif user_choice == "34th"
# 	puts "You have selected 34th"
# else 
# 	puts "You have not selected a station on line N"
# end


	puts "Where are you now?"
	answer = gets.chomp.downcase
	puts "Where would you like to go?"
	answer_2 = gets.chomp.downcase

# user_choice = origin

n_line = ["8th_1", "Times Square", "Union Square", "23rd", "34th"]
# 6_line == ["Grand Central", "Astor Place", "23rd_1", "28th_1", "33rd"]
# l_line == ["8th", "6th", "Union Square" "3rd", "1st"]


if n_line.index(answer).abs - n_line.index(answer_2).abs 
	puts "There are {(n_line.index(answer) - n_line.index(answer_2)).abs }  stops until you reach your new destination"
end


# if user_choice = 1
# 	puts "This is Line N. The stations are: 8th, Times Square, Union Square, 23rd, 34th"

# elsif user_choice = 2
# 	puts "This is Line L"


# elsif user_choice = 3 
# 	puts "This is Line 6"

# else 
# 	puts "This is not a correct line"
# end

# user_choice = selection


# if answer == n_line 
# 	puts "You have chosen the n line"
# end

# end
# 6_line = ["Grand Central", "Astor Place", "23rd_1", "28th_1", "33rd"]
# l_line = ["8th", "6th", "Union Square" "3rd", "1st"]

	




 	# puts "There are #{6_line.index(answer) + 6_line.index(answer_2)} stops until you reach your new destination"
 	# # puts "There are #{l_line.index(answer) + l_line.index(answer_2)} stops until you reach your new destination"





# 6_line = ["Grand Central", "Astor Place", "23rd_1", "28th_1", "33rd"]

# l_line = ["8th", "6th", "Union Square" "3rd", "1st"]

# ["8th_1", "Times Square", "Union Square", "23rd", "34th"]
# elsif answer_2 = l_line
# 	puts "There are #{l_line.index(answer) + l_line.index(answer_2)} stops until you reach your new destination"
# elsif answer_2 = l_line
# 	puts "There are #{l_line.index(answer) + l_line.index(answer_2)} stops until you reach your new destination"




# if origin == "n"
# 	puts "You are currently on Line N"
# end
# if origin == "l"
# 	puts "You are currently of Line L"
# end
# if origin == "6"
# 	puts "you are currently on Line 6"
# end

# [origin.index(Times_Square)-(Line-N).index(line_N)]

# def menu1
# 	puts "Times Square"
# 	puts "34th" 
# 	puts "28th" 
# 	puts "23rd" 
# 	puts "Union Square" 
# 	puts "8th"
# 	print "Where would you like to travel to?"
# end

# if 

# origin = menu1

# def read_selection
# 	menu_1
# 	origin = gets.chomp
# end

# read_selection = menu1		

# if origin == "Line N"
# 	puts "You are currently on Line N"
# end
# if origin == "Line L"
# 	puts "You are currently of Line L"
# end
# if origin == "Line 6"
# 	puts "you are currently on Line 6"
# end







# def menu1
# 	print "Where would you like to travel to?"
# 	puts "Times Square"
# 	puts "34th" 
# 	puts "28th" 
# 	puts "23rd" 
# 	puts "Union Square" 
# 	puts "8th"
	




# 	origin = destination

# l_line = ["8th", "6th", "Union Sqaure" "3rd", "1st"]
# 	if origin -= l_line
# 		puts "You are travelling on line L"

	

# 	l_line = {
# 		"N_line" => {
# 			:eighth => "8th",
# 	 		:sixth => "6th",
# 	 		:Union_Square => "Union Square",
# 	 		:third => "3rd",
# 	 		:first => "1st"
# 	}
# }


# n_line = ["8th_1", "Times Square", " Union Square", "23rd" "34th"]

# 6_line = ["Grand Central", "Astor Place", "23rd_1", "28th_1", "33rd"]


# }


# n_line = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
# 	n_line = {
# 		n_line => "N Line"
# 			:Times_Square => "Times Square",
# 			:stop_34 => "34th",
# 			:stop_28 => "28th",
# 			:stop_23 => "23rd",
# 			:union_square => "Union Square"
# 		}