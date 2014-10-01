# LINES 
lines_hash = {
	"N" => ["Times Square" , "34th" , "28th-N", "23rd-N", "Union Square", "8th-N"],
	"L" => ["8th-L", "6th", "Union Square", "3rd" ,"1st"],
	"6" => ["Grand Central", "33rd", "28th-Six", "23rd-Six", "Union Square", "Astor Place"]
}

# Find which line a stop belongs to.
def find_line(lines, stop)
	lines.each_pair { |key, line| return key if line.include?(stop) }
end

# Return distance and stops between two stops within the same line.
def line_distance(lines, line, start, stop)

	# Find the distance and range between stops
	distance = lines[line].index(stop) - lines[line].index(start)
	range = 1..distance 
	range = distance..-1 if distance < 0

	# Create the list of stations
	stations_array = []
	range.each do |x|
			stations_array << lines[line][lines[line].index(start) + x]
	end
	
	# Reverse if needed
	stations_array.reverse! if distance < 0

	return distance.abs, stations_array
end 

# Returns distance and stops between any two stops
def stops_to(lines, start_stop, end_stop)
	start_line = find_line(lines, start_stop)
	end_line = find_line(lines, end_stop)

	if start_line == end_line # Just calculate the one distance 
		return line_distance(lines, start_line, start_stop, end_stop)
	
	else # Calculate distance for each line and direction from US seperately then add
		first_distance = line_distance(lines, start_line, start_stop, "Union Square")
		second_distance = line_distance(lines, end_line, "Union Square", end_stop)
		return first_distance[0] + second_distance[0], first_distance[1] + second_distance[1]
	end
end

#### MENU SYSTEM #####

running = true 

def print_locations(locations)
	puts ""
	(0..locations.length-1).each do |x|
		print "#{x}.#{locations[x] + ( " " * ( 17 - locations[x].length))}"
		puts " " if x % 3 == 0 && x != 0
	end
	puts " "
	puts " "
	puts "Q. Quit"
end

def select_stations(lines) 
	system('clear')
	user_choice = 0

	# Get all the locations into an array, sorted and no dupes. 
	all_locations = []
	lines.each_value {|value| all_locations << value}
	all_locations.flatten!.sort!.uniq!

	# Menu
	puts " " 
	puts "NEW YORK TRAIN SYSTEM"
	puts "---------------------"
	puts "Please select your current location"
	print_locations(all_locations)
	puts " "

	# Get User input, check if they are quitting, check if the item exsists
	user_choice = gets.chomp
	return false if user_choice.downcase == "q" # Quick Quit

	if all_locations[user_choice.to_i] == nil
		return true

	else

		# Display second menu
		system('clear')
		user_start = all_locations[user_choice.to_i]
		puts " " 
		puts "NEW YORK TRAIN SYSTEM"
		puts "---------------------"
		puts "Please select your destination"
		print_locations(all_locations)
		puts " "

		# Get destination, check if they want to quit or if its real
		user_choice = gets.chomp
		return false if user_choice.downcase == "q" # Quick Quit

		if all_locations[user_choice.to_i].empty?
			return true

		else 

			# Call stops_to and display results
			system('clear')
			user_end = all_locations[user_choice.to_i]
			distance = stops_to(lines, user_start, user_end)

			puts " " 
			puts "NEW YORK TRAIN SYSTEM"
			puts "---------------------"
			puts "Total stops from #{user_start} to #{user_end}: #{distance[0]}"
			print "You will be stopping at "
			distance[1].each do |x| 
				print x + ", "
			end
			puts " "

			# Final quit check
			print "Safe travels! Again? (y/n) "
			return false if gets.chomp.downcase == "n"
		end
	end

	return true 
end

#### MAIN LOOP ####

while running
	running = select_stations(lines_hash)
end 

system('clear')

