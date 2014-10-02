require 'sinatra'
require 'sinatra/reloader'
require 'pry'
lines = {
		"n" => ["times square", "34th", "28th", "23rd", "union square", "8th"],
		"l" => ["8th", "6th", "union square", "3rd", "1st"],
		"six" => ["grand central", "33rd", "28th", "23rd", "union square", "astor_place"]
		}

def user_journey(starting_point,stopping_point,all_the_stations)
	
		parts = starting_point.split(',')
		station_line = parts[0]
		starting_point = parts[1]
			second_parts = stopping_point.split(',')


	station_line = second_parts[0]
	stopping_point = second_parts[1]
	
	start_index = all_the_stations[station_line].index(starting_point)
	stop_index = all_the_stations[station_line].index(stopping_point)
	puts all_the_stations
	num_stops = (start_index - stop_index).abs

	if start_index > stop_index
			results = all_the_stations[station_line].slice(stop_index,(num_stops + 1 )).reverse
	else 
			results = all_the_stations[station_line].slice(start_index,(num_stops + 1 ))

	end
	return results
end


get '/'  do
	if params["starting_point"] && params["stopping_point"]
		@results = user_journey(params["starting_point"], params["stopping_point"], lines)
		puts @results
	end

@lines = lines

binding.pry

	erb :mta
end