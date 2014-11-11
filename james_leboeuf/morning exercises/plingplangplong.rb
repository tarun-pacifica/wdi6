# Pling Plang Plong
# Write a program that converts a number to a string per the following rules:

# If the number contains 3 as a prime factor, output 'Pling'. If the number contains 5 as a prime factor, output 'Plang'. If the number contains 7 as a prime factor, output 'Plong'.

# If the number does not contain 3, 5, or 7 as a prime factor, simply return the string representation of the number itself.

# E.g.

# The prime factors of 28 are [2, 2, 7].

# drops = Raindrops.new.convert(28)
# # => "Plong"
# The prime factors of 1755 are [3, 3, 3, 5, 13].

# drops = Raindrops.new.convert(1755)
# # => "PlingPlang"
# The prime factors of 34 are [2, 17].

# drops = Raindrops.new.convert(34)
# # => "34"
# Source

# A variation on a famous interview question intended to weed out the obviously incompetent.
require 'prime'
require 'pry'


class Raindrops
  def convert(n)
    factors = Prime.prime_division(n).flatten.uniq
    str = ''
    factors.each do |n|
      str += case n 
      when 3 then 'Pling'
      when 5 then 'Plang'
      when 7 then 'Plong'
      else ''
      end 
    end 
    unless str.empty?
      str
    else 
      n.to_s
    end 
  end 
end 

binding.pry


# OR

# require "pry"

# class Raindrops
#   def convert(num)
#     output = []
#     num = num.to_i

#     if num % 3 == 0 
#       output << "Pling"
#     end

#     if num % 5 == 0
#       output << "Plang"
#     end

#     if num % 7 == 0
#       output << "Plong"
#     end

#     if output.length == 0 
#       output << num.to_s
#     end

#     puts output.join("")
#   end   
# end
# Raindrops.new.convert(10);
# Raindrops.new.convert(15);
# Raindrops.new.convert(21);
# Raindrops.new.convert(34);

