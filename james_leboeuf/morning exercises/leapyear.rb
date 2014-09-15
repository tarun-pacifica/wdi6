# Leap
# Write a program that will take a year and report if it is a leap year. The tricky thing here is that a leap year occurs:

# on every year that is evenly divisible by 4
#   except every year that is evenly divisible by 100
#     except every year that is evenly divisible by 400.
# For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.

# Your program should be called as follows:

# Year.new(1996).leap

# Extensions

# Monkeypatch Fixnum to provide a leap_year? method:

# 2000.leap_year?
# Notes

# For a delightful, four minute explanation of the whole leap year phenomenon, go watch this youtube video (later!).

# Source

# JavaRanch Cattle Drive, exercise 3
require 'pry'


class Year
	def initialize(year)
		@year = year # Everytime I create a new year, it's going to remember what we passed into it. Keeps track of different years in memory.
	end

	def leap?
		# @year % 4 == 0 && @year % 100 == 0 && @year % 400 == 0 # Cheating way of returning true.
		divides_by_4 && divides_by_100 && divides_by_400
	end

	def divides_by_4
		@year % 4 == 0
	end

	def divides_by_100
		@year % 100 == 0
	end

	def divides_by_400
		@year % 400 == 0
	end

	def show_self


	end

end

## !!! When typing in pry, you can easily not have to set your answer to variable by typing in 
## !!! Year.new(2001).leap?
## !!! returns false or true based on the year

class Fixnum #Monkey patching. Opening the class and changing it very slightly, or alot slightly.

	def leap_year?
		Year.new(self).leap? # Self means the thing/object i'm dealing with. Takes the point of setting it to a variable. 
	end

end

2014.times do |y|
	# Display all the years from 0 - 2014 that are leap years
	year = Year.new(y)
	puts " #{ y } is a leap year" if year.leap?

end

# binding.pry




