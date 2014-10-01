require 'pry'

class Year
	attr_accessor :year

	def initialize(year)
		@year = year
	end

	def leap?
		#leap years are divisible on 4 but not 100 unless they are also divisible by 400
		if divisible_by_4? || (divisible_by_100? && divisible_by_400?)
			puts "The year #{ @year } is a leap year."
		else
			puts "The year #{ @year } is not a leap year."
		end
	end

	def divisible_by_4?
		@year % 4 == 0
	end

	def divisible_by_100?
		@year % 100 != 0
	end

	def divisible_by_400?
		@year % 400 == 0
	end
end

puts "What is the year: "

year = gets.chomp.to_i

Year.new(year).leap?

#make it for any amount of years
#2014.times |y|
	#year = Year.new(y)
	#puts " #{y} is a leap year: #{ year.leap? }"
#end

#add the new method. Monkeypatching
# class Fixnam
# 	def leap_year
# 		Year.new(self).leap?
# 	end
# end


#binding.pry