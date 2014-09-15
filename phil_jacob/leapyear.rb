# Leap
# Write a program that will take a year and report if it is a leap year. The tricky thing here is that a leap year occurs:

# on every year that is evenly divisible by 4
#   except every year that is evenly divisible by 100
#     except every year that is evenly divisible by 400.
# For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.

# Your program should be called as follows:

# Year.new(1996).leap?
# Extensions

# Monkeypatch Fixnum to provide a leap_year? method:

# 2000.leap_year?

JOEL WAY OF DOING it
require 'pry'

class Year
		def initialize(year)
			@year = year
		end


		# def leap?
		# 	#leap years are divisible by 4 but not 100 unless they are divisible by 400
		# 	if (@year % 4) == 0 && ((@year % 100 != 0) || (@year % 400 == 0))

				# To test on Pry Year.new(1996).leap?


		def leap?
		# 	#leap years are divisible by 4 but not 100 unless they are divisible by 400
		divides_by_4? && ( does_not_divide_by_100? || divides_by_400? )

		def divides_by_4?
			(@year % 4) == 0
		end

		def does_not_divide_by_100?
			@year %100 != 0
		end

		def divides_by_400?
			@year % 400 == 0
		end
	end


3000.times do |y|
	year = Year.new(y)
	puts "#{ y } is a leap year: #{ year.leap?}"
binding.pry

def leap_year
	input_year = gets.chomp.to_i
	if input_year % 4 == 0 && input_year % 100 == 0 && input_year % 400 == 0
		puts
		puts "#{input_year} is a leap year."
	else
		puts
		puts "#{input_year} is NOT a leap year."
	end
	puts
	print "Press any key to try again."
	gets
	menu
end

def menu
puts
system "clear"
puts
puts "Type a year to check its leap year status: "
puts 
leap_year
end

puts menu
# def read_selection
# 	menu
# 	gets.chomp.upcase
# end

# user_choice = read_selection


