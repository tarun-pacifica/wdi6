# give that I am on line n
# and I am at station 34th
# when I travel to station 8th
# I should have stopped at 4 stations

# lines = {
#   'n' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
#   'l' => ['8th', '6th', 'Union Square', '3rd', '1st'],
#   '6' => ['Grand Central', '33rd', '28th', 'Union Square', 'Astor Place']
# }

# puts "Enter the line (#{lines.keys.join(', ')}): "
# line = gets.chomp
# stations = lines[line]
# puts "Enter the departure station (#{stations.join(', ')}) : "
# departure_station = gets.chomp
# puts "Enter the destination station (#{stations.join(', ')}) : "
# destination_station = gets.chomp

# number_of_stations = (stations.index(destination_station) - stations.index(departure_station)).abs
# puts "total number of stations: #{number_of_stations}"

class MtaSingle
  attr_accessor :line, :departure_station, :destination_station

  LINES = {
    'n' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
    'l' => ['8th', '6th', 'Union Square', '3rd', '1st'],
    '6' => ['Grand Central', '33rd', '28th', 'Union Square', 'Astor Place']
  }

  def number_of_stations
    (stations.index(destination_station) - stations.index(departure_station)).abs
  end

  def stations
    LINES[line]
  end
end

mta = MtaSingle.new

puts "Enter the line (#{MtaSingle::LINES.keys.join(', ')}): "
mta.line = gets.chomp
puts "Enter the departure station (#{mta.stations.join(', ')}) : "
mta.departure_station = gets.chomp
puts "Enter the destination station (#{mta.stations.join(', ')}) : "
mta.destination_station = gets.chomp

puts "total number of stations: #{mta.number_of_stations}"
