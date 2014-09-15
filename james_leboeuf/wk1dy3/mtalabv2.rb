system('clear')

$line_n = ["Times Square", "34th", "28th_n", "23rd_n", "Union Square", "8th_n"]
$line_l = ["8th_l", "6th", "Union Square", "3rd", "1st"]
$line_6 = ["Grand Central", "33rd", "28th_6", "23rd_6", "Union Square", "Astor Place"]

# set the intersection as the starting index.


# intersection = $line_n & $line_l & $line_6

# starting_subway = $line_n || $line_l || $line_6



# intersection = $line_n.last
# 	# $line_l.first = intersection
# 	# $line_6.first = intersection


def ask(question)
	puts question
	gets.chomp
end


def display_title
	system('clear')
	puts "<<< MTA INC >>>"
	puts "==============="
end

def display_line_n_with_stations
	display_title
	puts "--LINE N--"
	$line_n.each_with_index { |name, index| puts "#{ index }: #{ name }" }
end

def display_line_l_with_stations
	display_title
	puts "--LINE L--"
	$line_l.each_with_index { |name, index| puts "#{ index }: #{ name }" }
end

def display_line_6_with_stations
	display_title
	puts "--LINE 6--"
	$line_6.each_with_index { |name, index| puts "#{ index }: #{ name }" }
end




def select_train_line_and_station
	display_title
 user_current_train_choice = ask("Please select which train line you are currently on. (N/L/6)")

	if user_current_train_choice == 'n'
		display_line_n_with_stations
		user_n_station_choice = ask("Please select which station you are currently at")
		user_n_destination_train_choice = ask("Which train line do you want to take?(N/L/6)")

	if user_n_destination_train_choice == "l"
			display_line_l_with_stations
			user_l_destination_station_choice = ask("Which train station do you want to stop at?")

			
			# l_difference = $line_n.index("Union Square") + $line_l.index(user_l_destination_station_choice)
			puts ""
		end
	end
end
# 		else 
# 			user_n_destination_station_choice = ask("Which train station do you want to stop at?")
# 			if 
# 				user_n_destination_train_choice == user_current_train_choice
# 				line_n_difference = $line_n.index(user_n_station_choice) - $line_n.index(user_n_destination_station_choice)
# 				puts "Your staying on the the #{ user_current_train_choice } line and will take approximately #{ line_n_difference.abs } stops"
# 				puts
# 			end

# 	if
# 		user_current_train_choice == 'l'
# 		display_line_l_with_stations
# 		user_l_station_choice = ask("Please select which station you are currently at")
# 		user_l_destination_train_choice = ask("Which train line do you want to take?(N/L/6)")
# 		user_l_destination_station_choice = ask("Which train station do you want to stop at?")

# 			if 
# 				user_l_destination_train_choice == user_current_train_choice
# 				line_l_difference = $line_l.index(user_l_station_choice) - $line_l.index(user_l_destination_station_choice)
# 				puts "Your staying on the the #{ user_current_train_choice } line and will take approximately #{ line_l_difference.abs } stops"
# 				puts
# 			end

# 	elsif 
# 		user_current_train_choice == '6'
# 		display_line_6_with_stations
# 		user_6_station_choice = ask("Please select which station you are currently at")
# 		user_6_destination_train_choice = ask("Which train line do you want to take?(N/L/6)")
# 		user_6_destination_station_choice = ask("Which train station do you want to stop at?")

# 			if 
# 				user_6_destination_train_choice == user_current_train_choice
# 				line_6_difference = $line_6.index(user_6_station_choice) - $line_6.index(user_6_destination_station_choice)
# 				puts "Your staying on the the #{ user_current_train_choice } line and will take approximately #{ line_6_difference.abs } stops"
# 				puts
# 			end
# 		end

# 	end

# end

def union_square_difference

end


def menu
	puts "1. Select Train Line and Station"
	puts "2. Intersection"
	puts "Q. Quit"
	print "Enter your selection (Type 1, 2, or 3): "
end

def read_selection
	menu
	gets.chomp.downcase
end

user_choice = read_selection

until user_choice == "q"
	case user_choice
	when '1'
		select_train_line_and_station
	when '2'
		puts intersection
	when '3'
		
	end
	user_choice = read_selection
end





