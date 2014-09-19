require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get "/" do 
	erb :home
end

post "/" do 

	erb :request
end

get "/request" do
	@onboarding = params['onboarding_station']
	@disembarking = params['disembarking_station']

	# Declaring the neccessary variables
	@onboarding_pair = @onboarding.split "_"
		@board_st = @onboarding_pair[0]
		@board_l = @onboarding_pair[1]

	@disembarking_pair = @disembarking.split "_" 
		@disemb_st = @disembarking_pair[0]
		@disemb_l = @disembarking_pair[1]

######### MTA LAB ######### 
$mta_subway = { 
	"n" => ["timessquare", "34th", "28th", "23rd", "unionsquare", "8th"],
	"l" => ["8th", "6th", "unionsquare", "3rd", "1st"],
	"6" => ["grandcentral", "33rd", "28th", "23rd", "unionsquare", "astorplace"]
}

	potential_lines = ["n", "l", "6"]

	####################### What is your commute? #######################
	potential_lines = ["n", "l", "6"]
	board_line = $mta_subway[@board_l]
	disemb_line = $mta_subway[@disemb_l]

		##### => YOU ARE GETTING OFF ON THE SAME STOP YOU'RE BOARDING
		if 		@board_l == @disemb_l && @board_st == @disemb_st
					erb "Why are you catching the subway? You're already there!"

		##### => SAME SUBWAY
		elsif	@board_l == @disemb_l && @board_st != @disemb_st
					# No change in stops

					no_change_stops_between = ( board_line.index(@board_st) - disemb_line.index(@disemb_st) )

					#The names of the stops
					if no_change_stops_between >= 0 	
						@station_stop_array = board_line[disemb_line.index(@disemb_st) .. (board_line.index(@board_st))]	# if we are going backwards on the line
					else
						@station_stop_array = board_line.reverse[disemb_line.reverse.index(@disemb_st) .. (board_line.reverse.index(@board_st))] 	#pull out if going forwards
					end
				erb "There are #{ no_change_stops_between.abs } stop(s) to pass on your line. The stops you will be travelling through are: #{@station_stop_array}."


		##### => YOU ARE BOARDING FROM UNION SQUARE SO YOU DON'T NEED TO CHANGE LINES
		elsif 	(@board_st == 'unionsquare') && @board_l !=@disemb_l 		# You are boarding at US for another train when you don't need to! You're already there!
					
					no_change_stops_between = ( disemb_line.index(@board_st) - disemb_line.index(@disemb_st) )

					if no_change_stops_between >= 0 	
						@station_stop_array = disemb_line[disemb_line.index(@disemb_st) .. (disemb_line.index(@board_st))]	# if we are going backwards on the line
					else
						@station_stop_array = disemb_line.reverse[disemb_line.reverse.index(@disemb_st) .. (disemb_line.reverse.index(@board_st))] 	#pull out if going forwards
					end
			erb "Why do you have to change lines when you're disembarking at Union Square? That's silly! 
				There are #{ no_change_stops_between.abs } stop(s) to pass on your line. The stops you will be travelling through are: #{@station_stop_array}."

		##### => YOU ARE DISEMBARKING FROM UNION SQUARE SO YOU DON'T NEED TO CHANGE LINES
		elsif 	(@disemb_st == 'unionsquare') && @board_l != @disemb_l 	# You are disembarking at US for another train when you don't need to

					# No change in stops
					no_change_stops_between = ( board_line.index(@board_st) - board_line.index(@disemb_st) )

					puts "The stops you will be travelling through are: "			#The names of the stops
					if no_change_stops_between >= 0 	
						@station_stop_array =  board_line[board_line.index(@disemb_st) .. (board_line.index(@board_st))]	# if we are going backwards on the line
					else
						@station_stop_array =  board_line.reverse[board_line.reverse.index(@disemb_st) .. (board_line.reverse.index(@board_st))] 	#pull out if going forwards
					end

			erb "Why do you have to change lines when you're disembarking at Union Square? That's silly! 
				There are #{ no_change_stops_between.abs } stop(s) to pass on your line. The stops you will be travelling through are: #{@station_stop_array}."


		##### => YOU ARE GOING TO CHANGE TRAINS! YAY!
		else  	 		
					# There is a change in stops 
					first_line_changeover = ( board_line.index(@board_st) - board_line.index("unionsquare") )
					second_line_changeover = ( disemb_line.index("unionsquare") - disemb_line.index(@disemb_st) )

					#The stops you will be travelling through on the first line are: 
					if first_line_changeover >= 0 	
						first_stops = board_line[board_line.index("unionsquare") .. (board_line.index(@board_st))].reverse	# if we are going backwards on the line
					else
						first_stops = board_line.reverse[board_line.reverse.index("unionsquare") .. (board_line.reverse.index(@board_st))].reverse 	#pull out if going forwards
					end

					#The stops you will be travelling through on the second line are: 
					if second_line_changeover >= 0 	
						second_stops = disemb_line[disemb_line.index(@disemb_st) .. (disemb_line.index("unionsquare"))].reverse	# if we are going backwards on the line
					else
						second_stops = disemb_line.reverse[disemb_line.reverse.index(@disemb_st) .. (disemb_line.reverse.index("unionsquare"))].reverse 	#pull out if going forwards
					end



			erb "There are #{first_line_changeover.abs} stop(s) to pass on your first line. 
				There are #{second_line_changeover.abs} stop(s) to pass on your second line.
				The total number of stops will be #{ first_line_changeover.abs + second_line_changeover.abs }.
				The total stops you are travelling over, with a change at Union Square, are: #{ [first_stops, second_stops].flatten.uniq.join ", " }"

		end

######### MTA LAB END ######### 

	# erb :request
end