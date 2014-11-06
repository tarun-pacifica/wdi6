require 'pry'
require 'prime'
# nth Prime
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# Write a program that can tell you what the nth prime is.

# What is the 10 001st prime number?


class Prime

  def self.nth(n)
    Prime.first(n).last
  end

  # (1..10).inject({}) { |hash, num| hash[num] = "£#{num}"; hash }

  # def is_prime(n)
  #   return false if n <= 1
  #   2.upto(Math.sqrt(n).to_i) do |x|
  #     return false if n%x == 0
  #   end
  #   true
  # end

end

binding.pry
