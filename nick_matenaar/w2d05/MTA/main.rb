require 'sinatra'
require 'sinatra/reloader'

###############
#### LINES 
################

$LINES = {
	"N" => ["Times Square" , "34th" , "28th-N", "23rd-N", "Union Square", "8th-N"],
	"L" => ["8th-L", "6th", "Union Square", "3rd" ,"1st"],
	"6" => ["Grand Central", "33rd", "28th-Six", "23rd-Six", "Union Square", "Astor Place"]
}


############## 
#### FUNCTIONS 
###############

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

def get_stations(lines)
	all_locations = []
	lines.each_value {|value| all_locations << value}
	all_locations.flatten!.sort!.uniq!
end 


############## 
#### HTTP VERBS
###############

get '/' do 
	@locations = get_stations($LINES)
	erb :home
end 

post '/distance' do 
	@first_station = params['first_station'] 
	@second_station =  params['second_station']

	distance_array = stops_to($LINES, @first_station, @second_station)

	@total_stops = distance_array[0]
	@stations_array = distance_array[1]

	erb :distance
end 

