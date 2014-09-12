require 'pry'

# define array for each line. Index in array represents order in line
route_n = ['Times Square','34th','28th','23rd','Union Station','8th']
route_l = ['6th','8th','Union Station','3rd','1st']
route_6 = ['Grand Central','33rd','28th','23rd','Union Station','Astor Place']

print 'Enter Start Line: '
start_line = gets.chomp.upcase

#start_line = 'N'
print 'Enter Start Station: '
start_station = gets.chomp

#start_station = '23rd'
print 'Enter End Line: '
end_line = gets.chomp.upcase

#end_line = '6'
print 'Enter End Station: '
end_station = gets.chomp

#end_station = 'Grand Central'
case start_line
  when 'N'
  	# start index
  	start_index = route_n.index(start_station)
    # end index
    end_index = route_n.index(end_station)
    #find index of Union Station on start line
    junction_index_start = route_n.index('Union Station')
  when 'L'
  	# start index
  	start_index = route_l.index(start_station)
    # end index
    end_index = route_l.index(end_station)  	
    junction_index_start = route_l.index('Union Station')    
  when '6'
  	# start index
  	start_index = route_6.index(start_station)
    # end index
    end_index = route_6.index(end_station)  	
    junction_index_start = route_6.index('Union Station')    
  end

#if start and end station on same line
if start_line == end_line
  if start_index < end_index
  	num_stops = end_index - start_index
  else
  	num_stops = start_index - end_index
  end   
else
  # stations are on different lines, get end station index
  case end_line
  when 'N'
    # end index
    end_index = route_n.index(end_station)
    junction_index_end = route_n.index('Union Station')    
  when 'L'
    # end index
    end_index = route_l.index(end_station)  	
    junction_index_end = route_l.index('Union Station')        
  when '6'
    # end index
    end_index = route_6.index(end_station)  	
    junction_index_end = route_6.index('Union Station')            
  end

  # find num of stops on start line from start station to union station
  if start_index < junction_index_start
  	stops_to_junc_start = junction_index_start - start_index
  else
  	stops_to_junc_start = start_index - junction_index_start
  end

  # find num of stops on end line from end station to union station
  if end_index < junction_index_end
  	stops_to_junc_end = junction_index_end - end_index
  else
  	stops_to_junc_end = end_index - junction_index_end
  end

  num_stops = stops_to_junc_start + stops_to_junc_end

end

puts "Number of stops #{num_stops}"