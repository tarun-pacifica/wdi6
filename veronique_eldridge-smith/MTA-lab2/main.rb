require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :mta	
end

get '/trip' do
	#### DECLARE VARIABLES ###########
	#######################################################################
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
	
	######################################################################
	
	####### START AND FINISH POINTS FROM USER FORM INPUT #######
	########################################################################

	erb :trip
end


get '/result' do

	$get_on = params[:get_on].to_i

	$get_off = params[:get_off].to_i

	@trip = []

	def direction(start_point, end_point, line2)
		
		if start_point < end_point
			@next_stop = start_point + 1
			while @next_stop < end_point
			@trip << line2[@next_stop]
			@next_stop += 1
			end
			@trip << $subway_station[$get_off -1]
		end
		if start_point > end_point
			@next_stop = start_point - 1
			while @next_stop > end_point
				@trip << line2[@next_stop]
				@next_stop -= 1
			end
			@trip << $subway_station[$get_off -1]
		end
	end

	def travel(line)
		start_point_same = line.index $subway_station[$get_on - 1]
		end_point_same = line.index $subway_station[$get_off - 1]
		direction(start_point_same, end_point_same, line)
	end

	def list_stops_int(union_point, line1, line2)
		@next_stop = 0
		start_point_diff = line1.index $subway_station[$get_on - 1]
		while @next_stop < union_point
			@next_stop = start_point_diff + 1
			# FIXME
			@trip << line1[@next_stop] if line1[@next_stop]
			@next_stop += 1
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
			direction(start_point_diff, end_point_diff, line2)

		elsif line1 == $line_l
			list_stops_int(2, line1, line2)
			direction(start_point_diff, end_point_diff, line2)

		elsif line1 == $line_6
			list_stops_int(3, line1, line2)
			direction(start_point_diff, end_point_diff, line2)
		end
	end


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

	erb :result
end


	


