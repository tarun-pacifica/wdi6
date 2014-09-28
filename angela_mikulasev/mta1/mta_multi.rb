# given that I am on Line N
# and I am at station 28th
# When I change to station 6th on line L
# I should have stopped at 3 stations

lines = {
  'n' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  'l' => ['8th', '6th', 'Union Square', '3rd', '1st'],
  '6' => ['Grand Central', '33rd', '28th', 'Union Square', 'Astor Place']
}

puts "Enter the departure line (#{lines.keys.join(', ')}): " 
departure_line = gets.chomp
departure_stations = lines[departure_line]

puts "Enter the departure station (#{departure_stations.join(', ')}): "
departure_station = gets.chomp

puts "Enter the destination line (#{lines.keys.join(', ')}): "
destination_line = gets.chomp 
destination_stations = lines[destination_line]

puts "Enter the destination station (#{destination_stations.join(', ')}): "
destination_station = gets.chomp

number_of_stations = ((departure_stations.index('Union Square') - departure_stations.index(departure_station)).abs) + ((destination_stations.index('Union Square') - destination_stations.index(destination_station)).abs)
puts "total number of stations: #{number_of_stations}"
