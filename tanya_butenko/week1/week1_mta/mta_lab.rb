# Calculates the number of stations 
# that user has to pass to get on destination point


#a hash of lines and their values - stations
subway = {
	"N" => ["Times Square", "34", "28", "23", "Union Square", "8"],
	"L" => ["8", "6", "Union Square", "3", "1"],
	"6" => ["Grand Central", "33", "28", "23", "Union Square", "Astor Place"]
}

#asks user to select the line
def line
	puts "--------------"
	puts "Subway lines"
	puts "N"
	puts "L"
	puts "6"
	print "Choose which subway line you are going to use: "
end

#gets the input line
def read_line
	line
	gets.chomp
end

#gets the input station
def read_station
	print "Choose the station: "
    gets.chomp
end

#declare departure line
departure_line = read_line()

#gives list of station depending of the user's line choice
puts subway[departure_line]

#declare departue station
departure_station = read_station

#gets and declare arrival line
arrival_line = read_line()

#gives list of station depending of the user's line choice
puts subway[arrival_line]

#gets and declare arrival station
arrival_station = read_station

#calculates number of stations
if departure_line == arrival_line

	#gets the index number of departure and arrival station and substracts it
	n = subway[departure_line].find_index(arrival_station) - subway[departure_line].find_index(departure_station)
	result = n.abs #gets the abstract number
	puts "Number of station is #{result}"

else
	#finds the common station for all 3 lines
	com_station = (subway["N"] & subway["L"] & subway["6"]).shift

	n = subway[departure_line].find_index(com_station) - subway[departure_line].find_index(departure_station)
	n2 = subway[arrival_line].find_index(com_station) - subway[arrival_line].find_index(arrival_station)
	result = (n + n2).abs
	puts "Number of station is #{result}"

end

