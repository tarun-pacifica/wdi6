# Bob
# Bob is a lackadaisical teenager. In conversation, his responses are very limited.

# He answers 'Sure.' if you ask him a question. He answers 'Whatever.' if you tell him something. He answers 'Woah, chill out!' if you yell at him (ALL CAPS). He says 'Fine. Be that way!' if you address him without actually saying anything.

# Write Bob so that you can have an interactive conversation with him.

# Hints

# gets, get string is the opposite of puts put string.

# Notice that when you type "Something" and then hit enter, you get the string "Something\n"

# loop do
#   # talk to Bob here
# end
# Extensions

# l33t sP34k

# Bob, inspired by the 90s, is bringing back "l33t sP34k", and he'll teach you how to do it. Start any sentence with "Bro, ", and he'll translate the rest of it into l33t sP34k for you.

# In brief:

# Several vowels are always replaced with numbers: a = 4, e = 3, i = 1, o = 0
# Words that start with a consonant start with lower case
# Consonants after the first letter alternate upper and lower case, except the alternation starts over with lowercase after a digit (ex: sCh00l)
# Source

# Inspired by the 'Deaf Grandma' exercise in Chris Pine's Learn to Program tutorial.


class Teenager
	attr_accessor :name

	def initialize(name) # #The puts message will always run when a new teenager is created.
		puts "My name is #{ name }. How are you going dude?"
		@name = name #@name is a special variable, it's associated with an instance of the teenager. If you don't have the hat you can't access the name anymore.
	end

	def converse
		message = gets.chomp.strip
		if rude?(message)
			puts "Fine. Be that way!"
		elsif question?(message)
			puts "Sure."
		elsif all_caps?(message)
			puts "Woah, chill out!"
		elsif leet_request?(message)
			puts leet(message)
		else
			puts "Whatever."
		end
	end

	private
	def question?(m)
		m.end_with? '?'
	end

	def all_caps?(m)
		m == m.upcase
	end

	def rude?(m)
		m.empty?
	end

	def leet_request?(m)
		m[0..4] == 'Bro, '
	end

	def leet(m)
		m.sub!('Bro ', '') # On my original string, go find 'Bro ' and change it to nothing 
		m.tr('aeio', '4310')
	end

end

bob = Teenager.new('Bob')

require 'pry'
binding.pry

loop do
	bob.converse
end





