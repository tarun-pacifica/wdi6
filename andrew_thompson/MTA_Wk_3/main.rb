require 'pry'
require 'sinatra'
require 'sinatra/reloader'

system('clear')


gets '/' do

# Ask the user which line they're departing from.

def menu
	puts "Which line are you departing from?"
	puts "n?"
	puts "l?"
	puts "6?"
end
	
# Capture user train line selection using function read_selection

def read_selection
	menu
	gets.chomp
end

# Store selection as variable user_choice

user_choice = read_selection

# Each train line and all stops held within three arrays

n_line = ["Times Square", "34th", "28th-n", "23rd-n", "Union Square", "8th"]

l_line = ["8th", "6th", "Union Square", "3rd", '1st']

six_line = ["Grand Central", "33rd", "28th-6", "23rd-6", "Union Square", "Astor" ]


# In the case of variable user_choice = N Line, asks user for Origin and Destination

case user_choice 
	when "n"
		
			puts "From which station are you embarking?"
				origin = gets.chomp

			puts "Where do you need to go?"
				destination = gets.chomp

			answer = (n_line.index(destination) - n_line.index(origin)).abs 

			puts "You will arrive in #{answer} stops."

				# unless destination = "Union Square"


# In the case of variable user_choice = L Line, asks user for Origin and Destination

	when "l"

			puts "2. From which station are you embarking?"
				origin = gets.chomp

			puts "3. Where do you need to go?"
				destination = gets.chomp

			answer = (l_line.index(destination) - l_line.index(origin)).abs 

			puts "You will arrive in #{answer} stops."

# In the case of variable user_choice = 6 Line, asks user for Origin and Destination

	when "6"

			puts "2. From which station are you embarking?"
				origin = gets.chomp

			puts "3. Where do you need to go?"
				destination = gets.chomp

			answer = (six_line.index(destination) - six_line.index(origin)).abs 

# Puts distance between stops on a single line

			puts "You will arrive in #{answer} stops."

# If a line other than N, L and 6 is entered, puts "You're in the wrong city"

	else

			puts "You are in the wrong city"


	end

# elsif line =="l"	
# 	puts (l.index(destination) - l.index(origin)).abs

# elsif line =="six"
# 	puts (six.index(destination) - s.index(origin)).abs
# else
# 	puts "NAAAh"
# else puts "Sorry! Trackwork is being performed"



# end


	erb :new
end















