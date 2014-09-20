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
	all_the_lines.select{ |line, stops| stops.include?(station) }.keys.join
end


def trip_section(lines)
	start_point = params["starting_point"]
	end_point	= params["stopping_point"]
	line_found = find_line(start_point, lines)

	binding.pry
	start_index = lines[line_found].index(start_point)
	ending_index = lines[line_found].index(end_point)

	if start_index > ending_index
		stops_num = (start_index - ending_index).abs
		section = lines[line_found].slice(ending_index,stops_num + 1).reverse
	else
		stops_num = (start_index - ending_index).abs
		section =lines[line_found].slice(start_index,stops_num + 1)
	end
	
		# binding.pry
		section
end


get "/" do
	unless params["starting_point"].nil? && params["stopping_point"].nil?
		@trip_section = trip_section(lines)
	end
	@lines = lines
	erb :new
end







