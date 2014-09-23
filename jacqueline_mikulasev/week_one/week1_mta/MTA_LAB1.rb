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
