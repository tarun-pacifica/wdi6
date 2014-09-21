require "pry"
require "sinatra"
require "sinatra/reloader"

lines = {
"n" => ["Times Square", "34th on N", "28th on N", "23rd on N", "Union Square", "8th on N"],
"l" => ["8th on L", "6th on L", "Union Square", "3rd on L", "1st on L"],
"six" => ["Grand Central", "33rd on Six", "28th on Six", "23rd on Six", "Union Square", "Astor Place"]
}

#enumerable take a block. they work depending on hash or array. right now we have lines. Select works by giving me the key value pair that fulfills a condition inside the block. Use .find function

#lines.select {  |line, stops| stops.include? "Times Square"  }.keys.join
# => "n"
# Were finding the line, 

# n.slice(0,4)
# => ["Times Square", "34th", "28th", "23rd"]
# n.slice(2,4)
# => ["28th", "23rd", "Union Square", "8th"]
# n.index("34th")
# => 1 The index of 34th is 1, because array index starts @ 0.

# start_point = "Times Square"
# end_point = "23rd"
# stops_num = (n.index(start_point) - n.index(end_point)).abs
# => 3
# n.slice(n.index(start_point),stops_num + 1) #Slice works by taking the starting index as the first parameter, the second parameter is how many items you want from that array, including the first. +1 to list the full range.
# => ["Times Square", "34th", "28th", "23rd"]
# Check wether one has a higher index, if the index of times square=0.
def find_line(station, all_the_lines) 
#Taking in TWO arguments, the station start point, and all the lines.
#Then we break down LINES into two groups, by line and by stops.
#Then we say does the stops include? the station start point. Then we list it by keys,
	all_the_lines.select{ |line, stops| stops.include?(station) }.keys.join
end




def trip_section(lines)
	start_point = params["starting_point"]
	end_point	= params["stopping_point"]
	origin_line_found = find_line(start_point, lines)
	destination_line_found = find_line(end_point, lines)


	start_index = lines[origin_line_found].index(start_point)

	end_index = lines[destination_line_found].index(end_point)

	start_intersect_index = 0

	if origin_line_found == destination_line_found
		answer = (start_index - end_index).abs
		answer
	else
		intersect = "Union Square"

		start_intersect_index = lines[origin_line_found].index(intersect)
		end_intersect_index = lines[destination_line_found].index(intersect)

		start_line_stop = (start_intersect_index - start_index).abs

		end_line_stop = (end_intersect_index - end_index).abs

		total_stops = start_line_stop + end_line_stop
		total_stops

	end

	# if start_index > end_index
	# 	stops_num = (start_index - end_index).abs
	# 	section = lines[origin_line_found].slice(end_index,stops_num + 1).reverse
	# else
	# 	stops_num = (start_index - end_index).abs
	# 	section =lines[origin_line_found].slice(start_index,stops_num + 1)
	# end
	

end


get "/" do
	unless params["starting_point"].nil? && params["stopping_point"].nil?
		@trip_section = trip_section(lines)
	end
	@lines = lines
	erb :new
end







