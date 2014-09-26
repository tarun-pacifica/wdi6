require 'pry'

system('clear')


def menu
	puts "Which line are you departing from?"
	puts "n?"
	puts "l?"
	puts "6?"
end
	

def read_selection
	menu
	gets.chomp
end


user_choice = read_selection


n_line = ["Times Square", "34th", "28th-n", "23rd-n", "Union Square", "8th"]

l_line = ["8th", "6th", "Union Square", "3rd", '1st']

six_line = ["Grand Central", "33rd", "28th-6", "23rd-6", "Union Square", "Astor" ]


case user_choice 
	when "n"
		
			puts "From which station are you embarking?"
				origin = gets.chomp

			puts "Where do you need to go?"
				destination = gets.chomp

			answer = (n_line.index(destination) - n_line.index(origin)).abs 

			puts "You will arrive in #{answer} stops."

				

				



	when "l"

			puts "2. From which station are you embarking?"
				origin = gets.chomp

			puts "3. Where do you need to go?"
				destination = gets.chomp

			answer = (l_line.index(destination) - l_line.index(origin)).abs 

			puts "You will arrive in #{answer} stops."

	when "6"

			puts "2. From which station are you embarking?"
				origin = gets.chomp

			puts "3. Where do you need to go?"
				destination = gets.chomp

			answer = (six_line.index(destination) - six_line.index(origin)).abs 

			puts "You will arrive in #{answer} stops."


	else

			puts "You are in the wrong city"


	end



#start minus union square + end minus union square.



# elsif line =="l"	
# 	puts (l.index(destination) - l.index(origin)).abs

# elsif line =="six"
# 	puts (six.index(destination) - s.index(origin)).abs
# else
# 	puts "NAAAh"
# else puts "Sorry! Trackwork is being performed"



# end



















