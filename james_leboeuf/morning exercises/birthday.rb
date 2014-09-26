system('clear')
require 'pry'
require 'Date'
# Happy Birthday
# Write a program that asks what year a person was born in, then the month, then the day.

# Figure out how old they are and give them a PUNCH! for each birthday they have had.

# Extensions

# Write tests, and make sure that they will work if you run them on December 31st and January 1st.

# Source

# Taken from Chapter 9 in Chris Pine's online Learn to Program tutorial.

class Birthday

	def initialize
		@today = Date.today
	end

	def ask(question)
		print "#{ question }"
		gets.chomp.to_i
	end

	def congratulations
		@year = ask("What year were you born?")
		@day = ask("What day you were born?")
		@month = ask("What month were you born?")
	end

	def age(year, month, day)
		date_of_birth = Date.new(year,month,day)
		this_year = @today.year
		age_in_years = this_year - year
		if @today < Date.new(this_year,month,day)
			age_in_years -= 1 # Determining if they have had a birthday this year
		end
		age_in_years
	end

	def rocky
		congratulations
		age(@year,@month,@day).times do |punch|
			puts "PUNCH!"
			puts
		end
	end
	binding.pry
end
