system("clear")
puts "Hello! These are the stops you can hop on:"
puts " "
puts "1: Line 6 - Grand Central"
puts "2: Line 6 - 33rd"
puts "3: Line 6 - 28th"
puts "4: Line 6 - 23rd"
puts "5: Line 6 - Union Square"
puts "6: Line 6 - Aston Place"
puts " - - - - - - - - - - - - - - "
puts "11: Line N - Times Square"
puts "12: Line N - 34th"
puts "13: Line N - 21st"
puts "14: Line N - 23rd"
puts "15: Line N - Union Square"
puts "16: Line N - 8th"
puts " - - - - - - - - - - - - - - "
puts "21: Line L - 8th"
puts "22: Line L - 6th"
puts "23: Line L - Union Square"
puts "24: Line L - 3rd"
puts "25: Line L - 1st"
puts " "
puts "Enter the number of the station you hop ON: "
input_on = gets.chomp.to_i
puts " "
puts "Enter the number of the station you hop OFF: "
input_off = gets.chomp.to_i
puts " "


case input_on
	when 1..6
		line_on = :line_6
	when 11..16
		line_on = :line_N
	when 21..25
		line_on = :line_L
	else
		puts "Your entry is not part of the selection. You are not a friedly user. Walk through the rain instead."
end

case input_on
	when 1 then stop_on = "6_GC"
	when 2 then stop_on = "6_33"
	when 3 then stop_on = "6_28"
	when 4 then stop_on = "6_23"
	when 5 then stop_on = "US"
	when 6 then stop_on = "6_AP"
	when 11 then stop_on = "N_TS"
	when 12 then stop_on = "N_34"
	when 13 then stop_on = "N_21"
	when 14 then stop_on = "N_23"
	when 15 then stop_on = "US"
	when 16 then stop_on = "N_8"
	when 21 then stop_on = "L_8"
	when 22 then stop_on = "L_6"
	when 23 then stop_on = "US"
	when 24 then stop_on = "L_3"
	when 25 then stop_on = "L_1"
end

case input_off
	when 1 then stop_off = "6_GC"
	when 2 then stop_off = "6_33"
	when 3 then stop_off = "6_28"
	when 4 then stop_off = "6_23"
	when 5 then stop_off = "US"
	when 6 then stop_off = "6_AP"
	when 11 then stop_off = "N_TS"
	when 12 then stop_off = "N_34"
	when 13 then stop_off = "N_21"
	when 14 then stop_off = "N_23"
	when 15 then stop_off = "US"
	when 16 then stop_off = "N_8"
	when 21 then stop_off = "L_8"
	when 22 then stop_off = "L_6"
	when 23 then stop_off = "US"
	when 24 then stop_off = "L_3"
	when 25 then stop_off = "L_1"
end

		
			

case input_off
	when 1..6
		line_off = :line_6
	when 11..16
		line_off = :line_N
	when 21..25
		line_off = :line_L
	else
		puts "Your entry is not part of the selection. You are not a friedly user. Walk through the rain instead."
end


subway_lines = {
	:line_6 => {
		:station => ["6_GC", "6_33", "6_28", "6_23", "US", "6_AP"],
		},
	:line_N => {
		:station => ["N_TS", "N_34", "N_21", "N_23", "US", "N_8"],
		},
	:line_L => {
		:station => ["L_8", "L_6", "US", "L_3", "L_1"]
		},
}

index_1_on = subway_lines[line_on][:station].index(stop_on)
index_1_off = subway_lines[line_on][:station].index("US")
index_2_on = subway_lines[line_off][:station].index("US")
index_2_off = subway_lines[line_off][:station].index(stop_off)


if line_on == line_off #this is for the case that on and off are on the same line
	result = index_1_on + index_2_off
else #this is for the case that user has to switch trains at Union Square
	stops_til_US = (index_1_off - index_1_on).abs
	stops_from_US = (index_2_off - index_2_on).abs
	result = stops_til_US + stops_from_US
end

case result
	when 0
		puts "You are already at your destination."
	when 1
		puts "Dude, it's only one stop - just walk!"
	else
		puts "You will have to travel #{result} stops to arrive at your destination."
end
puts " "



# subway_lines["line_6"]["6_GC"].count



#Example: 
# User hops on line 6 on stop 6_GC and wants to hop off on line L on stop L_8
# User makes 4 entries: line_on, stop_on, line_off, stop_off
# User needs to go 5 stops to the right on line 6 to reach US
##Identify index of stop_on in the array
##Identify index of Union Square
##Calculate difference between those 2 = number of stops on line 6
# At US users needs to switch to line L
# User needs to go 2 stops to the left on line L
##Identify index of stop_off in the array
##Identify index of union square in the array
##Calculate difference between those 2 = number of stops on line L
# Add result from both lines to total number of stops

