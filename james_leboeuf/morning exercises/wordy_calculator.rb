require 'pry'
# Wordy Addition
# Write a program that takes a word problem in the format:

# What is 5 plus 13?
# and returns the answer as an integer.

# The program should handle large numbers and negative numbers.

# Extensions

# Modify your program to also handle problems of the type:
# What is 7 plus 9 plus 3?

# string = "What is 5 plus 13?"
# string.scan(/\p{N}/)

class Calculator

  def ask(question)
    parts = question.split(/\s+/) 
    index = nil
    parts.each_with_index do |word, i|
      if word.match /\d+/
        index = i
        break
      end
    end
    if index.nil?
      raise "No numbers found"
    end

    operand1 = parts[index].to_i
    operator = parts[index + 1].downcase
    operand2 = parts[index + 2].to_i

    result = case operator
    when "plus" then operand1 + operand2
    when "minus" then operand1 - operand2
    when "times" then operand1 * operand2
    when "over" then operand1 / operand2
    end

    result

  end
end
binding.pry




