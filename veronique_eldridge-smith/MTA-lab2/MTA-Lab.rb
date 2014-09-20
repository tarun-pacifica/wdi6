# variables for the stops
stop_1 = "1st"
stop_3 = "3rd"
stop_6 = "6th"
stop_8n = "8th on N"
stop_8l = "8th on L"
stop_23n = "23rd on N"
stop_236 = "23rd on 6th"
stop_28n = "28th on N"
stop_286 = "28th on 6th"
stop_33 = "33rd"
stop_34 = "34th"
$intersect = "Union Square"
ast = "Astor Place"
times = "Times Square"

# Array of stops
$subway_station = [stop_1, stop_3, stop_6, stop_8n, stop_8l, stop_23n, stop_236, stop_28n, stop_286, stop_33, stop_34, $intersect, ast, times] 

# arrays of stops for each of the 3 lines
$line_n = [times, stop_34, stop_28n, stop_23n, $intersect, stop_8n]
$line_l = [stop_8l, stop_6, $intersect, stop_3, stop_1]
$line_6 = [stop_33,stop_286,stop_236, $intersect, ast]

# Main menu listing all stops on the New York Subway
def menu
	puts "WELCOME TO THE NEW YORK SUBWAY!"
	puts "--------------------"
	puts "STOP SELECTION:"
	puts "--------------------"
	puts "1. 1st Stop"
	puts "2. 3rd Stop"
	puts "3. 6th Stop"
	puts "4. 8th Stop on N"
	puts "5. 8th Stop on L"
	puts "6. 23rd Stop on N"
	puts "7. 23rd Stop on 6th"
	puts "8. 28th Stop on N"
	puts "9. 28th Stop on 6th"
	puts "10. 33rd Stop"
	puts "11. 34th Stop"
	puts "12. Union Square"
	puts "13. Astor Place"
	puts "14. Times Square"
	puts "--------------------"
end

# Get starting point and end point from user
menu
print "Please select your starting point: "
$get_on = gets.to_i
print "Please select your end point: "
$get_off = gets.to_i

unless $get_on == $get_off

	def direction(start_point, end_point, line2)
		if start_point < end_point
			next_stop = start_point + 1
			while next_stop < end_point
			puts "Train goes through #{line2[next_stop]} station"
			next_stop += 1
			end
			puts "Get off at the next stop which is your destination: #{$subway_station[$get_off -1]}."
		end
		if end_point < start_point
			next_stop = start_point - 1
			while next_stop > end_point
			puts "Train goes through #{line2[next_stop]} station"
			next_stop -= 1
			end
			puts "Get off at the next stop which is your destination: #{$subway_station[$get_off -1]}."
		end
	end

	def travel(line)
		puts "There is a direct train to your destination!"
		puts "Board the train at #{$subway_station[$get_on - 1]}"
		start_point_same = line.index $subway_station[$get_on - 1]
		end_point_same = line.index $subway_station[$get_off - 1]
		direction(start_point_same, end_point_same, line)
	end

	def list_stops_int(union_point, line1, line2)
		next_stop = 0
		start_point_diff = line1.index $subway_station[$get_on - 1]
		while next_stop < union_point
			next_stop = start_point_diff + 1
			puts "Train goes through #{line1[next_stop]} station"
			next_stop += 1
		end
	end

	# case for start on some line and end on a different one
	def travel_diff(line1, line2)
		puts "You will need to change trains at UNION SQUARE!"
		puts "Board the train at #{$subway_station[$get_on - 1]}"
		end_point_diff = line2.index $subway_station[$get_off - 1]
		start_point_diff = line2.index $intersect

		### STARTING LINE IS WHICH?
		if line1 == $line_n
			list_stops_int(4, line1, line2)
			puts "Get off at the next stop: #{line1[4]}, and change lines."
			direction(start_point_diff, end_point_diff, line2)

		elsif line1 == $line_l
			list_stops_int(2, line1, line2)
			puts "Get off at the next stop: #{line1[2]}, and change lines"
			direction(start_point_diff, end_point_diff, line2)

		elsif line1 == $line_6
			list_stops_int(3, line1, line2)
			puts "Get off at the next stop: #{line1[3]}, and change lines."
			direction(start_point_diff, end_point_diff, line2)
		end
	end

	# test the user selected from the menu then display the stations they are travelling from/to
	if ((1..14).include? $get_on) && ((1..14).include? $get_off)
		system("clear")
		puts "You will be travelling from #{$subway_station[$get_on - 1]} and arriving at #{$subway_station[$get_off - 1]}"
		
		#case for start and finish stops being on the same line
		#case for travelling only on line N
		if ($line_n.include? $subway_station[$get_on - 1]) && ($line_n.include? $subway_station[$get_off - 1])
			travel($line_n)
		end

		#case for travelling only on line L
		if ($line_l.include? $subway_station[$get_on - 1]) && ($line_l.include? $subway_station[$get_off - 1])
			travel($line_l)
		end

		#case for travelling only on line 6
		if ($line_6.include? $subway_station[$get_on - 1]) && ($line_6.include? $subway_station[$get_off - 1])
			travel($line_6)
		end

		if $get_off != 12
			#case for start on line_n and end on line_l
			if ($line_n.include? $subway_station[$get_on - 1]) && ($line_l.include? $subway_station[$get_off - 1])
				travel_diff($line_n, $line_l)
			end

			#case for start on a line_n and end on line_6
			if ($line_n.include? $subway_station[$get_on - 1]) && ($line_6.include? $subway_station[$get_off - 1])
				travel_diff($line_n, $line_6)
			end

			#case for start on line_l and end on line_n
			if ($line_l.include? $subway_station[$get_on - 1]) && ($line_n.include? $subway_station[$get_off - 1])
				travel_diff($line_l, $line_n)
			end

			#case for start on a line_l and end on line_6
			if ($line_l.include? $subway_station[$get_on - 1]) && ($line_6.include? $subway_station[$get_off - 1])
				travel_diff($line_l, $line_6)
			end

			#case for start on a line_6 and end on line_n
			if ($line_6.include? $subway_station[$get_on - 1]) && ($line_n.include? $subway_station[$get_off - 1])
				travel_diff($line_6, $line_n)
			end

			#case for start on a line_6 and end on line_l
			if ($line_6.include? $subway_station[$get_on - 1]) && ($line_l.include? $subway_station[$get_off - 1])
				travel_diff($line_6, $line_l)
			end
		end
	else
		puts "WTF HAS HAPPENED."
	end
else
	puts "You MORON. Look around... you are AT your destination!"
end




