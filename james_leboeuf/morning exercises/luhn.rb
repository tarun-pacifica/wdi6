# Luhn Formula
# Write a program that can take a number and determine whether or not it is valid per the Luhn formula.

# The Luhn formula is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

# The formula verifies a number against its included check digit, which is usually appended to a partial number to generate the full number. This number must pass the following test:

# Counting from rightmost digit (which is the check digit) and moving left, double the value of every second digit.

# For any digits that thus become 10 or more, subtract 9 from the result.

# E.g., 1111 becomes 2121, while 8763 becomes 7733 (from 2×6=12 → 12-9=3 and 2×8=16 → 16-9=7).

# Add all these digits together. For example, if 1111 becomes 2121, then 2+1+2+1 is 6; and 8763 becomes 7733, so 7+7+3+3 is 20.

# If the total ends in 0 (put another way, if the total modulus 10 is congruent to 0), then the number is valid according to the Luhn formula; else it is not valid. So, 1111 is not valid (as shown above, it comes out to 6), while 8763 is valid (as shown above, it comes out to 20).

# Write a program that, given a number

# a) can check if it is valid per the Luhn formula. b) can add a check digit to make the number valid per the Luhn formula.

# Luhn.new(2323_2005_7766_3554).valid?
# => true

# 7532 => turn into string. then reverse it.
# http://rosettacode.org/wiki/Luhn_test_of_credit_card_numbers
require 'pry'


class Luhn

  def initialize(number)
    @number = number
  end

  def add_check
    # self is calling an object checksum
    check = self.checksum
    # 
    delta = check.round(-1) - check
    @number + delta
  end

  def checksum
    @number.to_s.reverse.split('').map.with_index do |digit, position|
      digit = digit.to_i
      if position.odd?
        digit = digit * 2
        digit -= 9 if (digit >= 10)
      end
      digit
      # Summing it up
    end.inject(:+)
  end

  def valid?
    checksum % 10 == 0
  end
end

Luhn.new(2323_2005_7766_3554).valid?
n = Luhn.new(2323_2005_7766_3554)
binding.pry
