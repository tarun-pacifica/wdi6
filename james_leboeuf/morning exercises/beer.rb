system('clear')
require 'pry'


class Beer

# Self refers to itself, so it can be called like Beer.song
	def self.main_verse(bottles)
		puts " #{ bottles } bottles of beer on the wall,"
		puts " #{ bottles } bottles of beer,"
		puts " I take One down and pass it around,"
		puts " #{ bottles - 1 } bottles of beer on the wall."
		puts
	end

	def self.second_last_verse(bottles)
		puts " 2 bottles of beer on the wall,"
		puts " 2 bottles of beer,"
		puts " take One down and pass it around,"
		puts " Only 1 bottle of beer on the wall."
		puts
	end

	def self.final_verse(bottles)
		puts " 1 bottles of beer on the wall,"
		puts " 1 bottles of beer,"
		puts " take one down and pass it around,"
		puts " No more bottles of beer on the wall."
		puts
	end

	def self.song(bottles=99)
		bottles.downto(3) do |bottles|
			self.main_verse(bottles)
		end
		self.second_last_verse
		self.final_verse
	end

end

class Fixnum

	def bottles_of_beer
		Beer.song(self)
	end
# binding.pry
end



# for n in 99.downto(0)
# 	if n > 1
# 		puts "#{ n } bottles of beer on the wall"
# 		puts "#{ n } bottles of beer,"
# 		puts "take 1 down and pass it around,"
# 		puts "#{ n - 1 } bottles of beers on the wall!"
# 		puts "================================"
# 	elsif n == 1
# 		puts "#{ n } bottle of beer on the wall"
# 		puts "#{ n } bottle of beer,"
# 		puts "take it down and pass it around,"
# 		puts "No bottles of beers on the wall!"
# 		puts "==============================="

# 	end
# end

