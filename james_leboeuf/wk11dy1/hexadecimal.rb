# On the web we use hexadecimal to represent colors, i.e. green: 008000, teal: 008080, navy: 000080).

# Write a program that will convert a hexadecimal number, represented as a string (i.e. "10af8c"), to it's decimal equivalent using first principles (i.e. no, you may not use built-in ruby libraries or gems to accomplish the conversion).

# The program should consider strings specifying an invalid hexadecimal as the value 0.

# Tests are provided, delete one skip at a time.
# require 'pry'
class Hexadecimal

    DIGITS = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'A' => 10,
    'B' => 11,
    'C' => 12,
    'D' => 13,
    'E' => 14,
    'F' => 15
  }

  def initialize(input)
    @input = input.upcase
  end

  def to_decimal
    if /[G-Z]/.match(@input)
      return 0
    else
      input_array = @input.split('')
      iterated_sum = []
      input_array.reverse.each_with_index do |item, index|
        value = DIGITS[item] * (16 ** index)
        iterated_sum << value
      end
      return result = iterated_sum.inject{|sum,x| sum + x }
    end
  end
end




