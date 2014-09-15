# Activity:

# Students should create a program that models a simple subway system.

# The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

# There are 3 subway lines:
# The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
# The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# All 3 subway lines intersect at Union Square, but there are no other intersection points.
# For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.
# Hints:

# Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
# Make subway lines are keys in a hash, while the values are an array of all the stops on each line.
# The key to the lab is to find the intersection of the lines at Union Square.
# Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)


#
# MANTRA
# Ask user what station they are at
# If 28th, 23rd, us, 8th ask which line they are on.
# Ask which station they are traveling to.
# If 28th, 23rd, us, 8th ask on which line is the station they traveling on.
# prints number of stops till exit, make mention of switch
#

#fix indentation so easy to read

subway = {
  "N" => ["8th Street", "Union Square", "23rd Street ", "28th Street", "34th Street", "Times Square"],
  "L" => ["1st Ave", "3rd Ave", "Union Square", "6th Ave", "8th Ave"],
  "Six" => ["Astor Place", "Union Square", "23rd Street", "28th Street", "33rd Street", "Grand Central"]
}

#Menu chosen so I could loop after answer and insert Q option because it was pissing me off by quitting every time
def menu
  puts
  puts "****** MTA ******"
  puts
  puts "Welcome to Phil's NYC Subway guide (press Q to quit at any time)"
  puts "________________________________"
  puts
  puts "Choose from the following subway lines: N, L, Six" #Couldn't put in an array for some reason
  puts
  print "What subway line will you be starting at?: "
end

def subway_choice 
  menu
  gets.chomp
end

#Still not sure if this is the most elegant solution or if it works on a non-menu page

starting_subway = subway_choice

until starting_subway.upcase == "Q" 

if 
  starting_subway == "N" || starting_subway == "L" || starting_subway == "Six"
  puts
  puts "Here are the starting stops: #{subway["#{starting_subway}"]}:"
  puts
  print "What stop would you like to get on?: "
   starting_stop = gets.chomp
  puts
  puts "Here are the subways: #{subway.keys}"
  puts
  print "Which line will you be traveling to?: "
  ending_subway = gets.chomp
  puts
  puts "Here are your possible destinations #{subway["#{ending_subway}"]}: "
  puts
  print "What station would you like to end at?: "
  ending_stop = gets.chomp
end

# if 
#   starting_subway != subway['N', 'L', 'Six']
#   puts
#   puts "Invalid choice. Please pick a proper line."
#   puts starting_subway = subway_choice
#   puts
# end

if (starting_subway == ending_subway)
    num_stops = (subway["#{starting_subway}"].index(starting_stop).to_i - subway["#{ending_subway}"].index(ending_stop).to_i).abs
  puts
  puts "Your trip will take #{num_stops} stops!"
  end

if  intersection = (subway["#{starting_subway}"] & subway["#{ending_subway}"]).join
    num_stops1 = (subway["#{starting_subway}"].index(starting_stop).to_i - subway["#{starting_subway}"].index(intersection).to_i).abs
    num_stops2 = (subway["#{ending_subway}"].index(ending_stop).to_i - subway["#{ending_subway}"].index(intersection).to_i).abs
end
  puts
  puts "Your trip will take #{num_stops1 + num_stops2} stops!"
  puts 
  puts starting_subway = subway_choice

end



