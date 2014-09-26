# Grandma
# Write a Deaf Grandma program.

# Whatever you say to grandma (whatever you type in), she should respond with

# HUH?! SPEAK UP, SONNY!
# unless you shout it (type in all capitals).

# If you shout, she can hear you (or at least she thinks so) and yells back

# NO, NOT SINCE 1938!
# To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950.

# You can't stop talking to grandma until you shout BYE.

# Extensions

# What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you. Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma.

# Have grandma tell you a story. Load the story from a .yml file. Grandma will only tell you one line of the story at a time, and to hear the next story you have to tell her "AND THEN".

# Source

# Chapter 6 in Chris Pine's online Learn to Program tutorial.


# class Grandma
# 	attr_accessor :name

# 	def initialize(name) # #The puts message will always run when a new teenager is created.
# 		puts "Hello Sonny, How are you going child?"
# 		@name = name #@name is a special variable, it's associated with an instance of the teenager. If you don't have the hat you can't access the name anymore.
# 	end

# 	def conversation
# 		input = gets.chomp.strip
# 			if input == "BYE"
# 				puts "GOOD BYE CHILD!"
# 				exit
# 			elsif input != input.upcase
# 				puts "HUH SPEAK UP SONNY!"
# 			elsif input == input.upcase
# 				puts "NO NOT SINCE #{ random_year }!"
# 			end
# 	end


# 	def random_year
# 		rand(1929..1951)
# 	end

# end

# granny = Grandma.new('granny')

# loop do
# 	granny.conversation
# end


class Granny

	def no
		puts "SPEAK UP SONNY"
	end

	def speak_up
		puts "NO, NOT SINCE #{ 1930 + rand(20) }"
	end

	def bye
		puts "BYE NOW YOU SPECIAL YOUNG PERSON"
	end

	def done?
		@bye == 3
	end

	def countbye(s)
		@bye ||= 0 #@bye is initialized if it doesn't have a value. So if @bye is equal to 1, leave it alone.
		if s == "BYE"
			@bye +=1
		else
			@bye = 0
		end
	end


	def response(s)
		countbye s
		if done?
			bye
		elsif s.empty? || s.upcase == s
			speak_up
		else
			no
		end
	end

	def talk
		begin
			puts response(gets.chomp)
		end until done?
	end

end

nan = Granny.new
nan.talk


