system('clear')
# require 'pry'

# Scrabble Score
# Write a program that, given a word, computes the scrabble score for that word.

# Scrabble.score("cabbage")
# # => 14
# Your program should be in a file named scrabble.rb.

# Letter Values

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# Source

# Inspired by the Extreme Startup game



# Create Key and Value hashes for Letters and Values

# ========
# Hash to record Letters(Keys) and its Values(Points its worth)
# "cabbage" => string
# Scrabble => class
# Method inside the class, which takes in a string, and gives us back a number

class Scrabble

	# raw_scores = {

	# 	%w{ A, E, I, O, U, L, N, R, S, T}  => 1,
	# 	%w{ D, G }                         => 2,
	# 	%w{ B, C, M, P }                   => 3,
	# 	%w{ F, H, V, W, Y }                => 4,
	# 	%w{ K }                            => 5,
	# 	%w{ J, X }                         => 8,
	# 	%w{ Q, Z }                         => 10

SCORE = { 
			 "A"=>1,
			 "E"=>1,
			 "I"=>1,
			 "O"=>1,
			 "U"=>1,
			 "L"=>1,
			 "N"=>1,
			 "R"=>1,
			 "S"=>1,
			 "T"=>1,
			 "D"=>2,
			 "G"=>2,
			 "B"=>3,
			 "C"=>3,
			 "M"=>3,
			 "P"=>3,
			 "F"=>4,
			 "H"=>4,
			 "V"=>4,
			 "W"=>4,
			 "Y"=>4,
			 "K"=>5,
			 "J"=>8,
			 "X"=>8,
			 "Q"=>10,
			 "Z"=>10
}

 # SCORE is constant so it doesn't change through the whole game

	def self.score(word)
	# 	sum = 0
	# 	word.upcase.split('').each do |letter|
	# 		sum += SCORE[letter]
	# 	end
	# 	sum
	# end
		word.upcase.split('').inject(0) do |sum, letter| #Inject you specify the initial value
			sum + SCORE[letter]
		end
	end

	def self.values
		SCORE
	end

require 'pry'
binding.pry

end

puts Scrabble.score('blah')







