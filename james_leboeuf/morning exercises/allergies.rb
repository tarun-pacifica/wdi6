system ('clear')
require 'pry'
# Allergies
# An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for).

# The list of items (and their value) that were tested are:

# eggs (1)
# peanuts (2)
# shellfish (4)
# strawberries (8)
# tomatoes (16)
# chocolate (32)
# pollen (64)
# cats (128)
# So if Tom is allergic to peanuts and chocolate, he gets a score of 34.

# Write a program that, given a person's score can tell them

# a) whether or not they're allergic to a given item, and b) the full list of allergies.



class Allergies



	ALLERGENS = {
	 1=>"eggs",
	 2=>"peanuts",
	 4=>"shellfish",
	 8=>"strawberries",
	 16=>"tomatoes",
	 32=>"chocolate",
	 64=>"pollen",
	 128=>"cats"
	}

	def initialize(flags)
		@flags = flags
	end

	def allergic_to?(allergen)
		list.include? allergen
	end

	def list
		allergies = []
		ALLERGENS.each do |code, allergen|
			if (@flags & code) > 0 # The & stands for Binary
				allergies << allergen
		end
	end
	allergies
end
end

allergies = Allergies.new(34)
puts allergies.allergic_to?('chocolate')
# => true
puts allergies.allergic_to?('cats')
# => false
puts allergies.list
# => ['peanuts', 'chocolate']

# binding.pry






