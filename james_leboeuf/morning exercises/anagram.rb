system('clear')
require 'pry'
# Anagram Detector
# Write a program that, given a word and a list of possible anagrams, selects the correct one(s).

# In other words, given: "listen" and %w(enlists google inlets banana) the program should return "inlets".

# Source

# Inspired by the Extreme Startup game.


# words = %w(enlists google inlets banana)
 
# # Anagrams are equal when all characters are sorted
# words_hash = words.each_with_object(Hash.new []) do |word, hash|
#   hash[word.chars.sort] += [word]
# end
 
# # Print the anagrams
# words_hash.each do |word, matching_words|
#   puts matching_words.join ', ' if matching_words.length > 1
# end

class Anagram
  attr_reader :subject, :letters

  def initialize(subject)
    @subject = subject
    @letters = breakdown(subject)
  end

  def match(words)
    words.select do |word|
      breakdown(word) == @letters
    end
  end

private

  def breakdown(word)
    word.chars.sort 
  end

end

# binding.pry

test1 = Anagram.new('creative')
p test1.match(%w(reactive create google inlist))




