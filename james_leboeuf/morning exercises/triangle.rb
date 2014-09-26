system('clear')
require 'pry'
# Triangle
# Create a method so if you call .triangle on 3 numbers, the result will tell you if a triangle is equilateral, isosceles, or scalene.

# eg

# (3,3,5).triangle = "isoceles"
# The program should raise an error if the triangle cannot exist.

# Source

# The Ruby Koans triangle project, parts 1 & 2.


# Equilateral Triangle	
# Equilateral Triangle

# Three equal sides 
# Three equal angles, always 60°

# Isosceles Triangle	
# Isosceles Triangle

# Two equal sides 
# Two equal angles

# Scalene Triangle	
# Scalene Triangle

# No equal sides 
# No equal angles

class Triangle

	def initialize
	end

	def self.equilateral(x, y, z)
		 if x == y && x == z
		 	"equilateral"
		 end
	end

	def self.scalene(x, y, z)
		if x != y && x != z && y != z
			"scalene"
		end
	end

	def self.isoceles(x, y, z)
		if x == y or y == z or z == x
			"isoceles"
		end
	end

	def self.check(x, y, z)
		puts equilateral(x,y,z) || scalene(x,y,z) || isoceles(x,y,z) || 'Not a triangle'
	end
	binding.pry
end

puts Triangle.check(3,8,5)







class Array
	return if self.length !=3
	@one = self[0]
	@two = self[1]
	@three = self[2]

	if @one == @two && @one != @three
		return 'isoceles'
	elsif @one == @three && @

