require 'pry'
# The Sieve of Eratosthenes
# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.

# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit.

# Create your range, starting at two and ending at the given limit.

# The algorithm consists of repeating the following over and over:

# take the next available unmarked number in your list (it is prime)
# note: if there is no such number, you're done.
# remove all the multiples of that number (they are not prime)
# When the algorithm terminates, all the numbers in the list that are not marked are prime.

# Source

# Sieve of Eratosthenes at Wikipedia

class Sieve
  def self.primes(bound)
    numbers = (2..bound).to_a
    primes = []
    while candidate = numbers.shift
      primes << candidate
      numbers = numbers.reject { |n| n % candidate == 0 }
    end
    primes
  end
end
primes_less_than_100 = Sieve.primes(100)

binding.pry






