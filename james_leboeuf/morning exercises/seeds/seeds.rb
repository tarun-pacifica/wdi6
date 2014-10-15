# Seeds
# There once was a wise servant who saved the life of a prince. The king promised to pay whatever the servant could dream up. Knowing that the king loved chess, the servant told the king he would like to have seeds. One seed on the first square of a chess board. Two seeds on the next. Four seeds on the third, and so on. There are 64 squares on a chessboard.

# Write a program that shows

# how many seeds were on each square, and
# the total number of seeds

# def number_of_seeds(boardsquare)
#   2 ** (boardsquare - 1)
# end

# def total_seeds(seeds)
#   (1..seeds).inject { |sum, number| sum + number_of_seeds(number)}
# end


# p total_seeds(8)
# p number_of_seeds(5)


# Taruns Solution

class Seedy

  def square(n)
    2 ** (n - 1)
  end

  def total(n)
    (1..n).map { |n| square(n) }.reduce(:+) 
    # Can also do .reduce(:*) or .reduce(:-)
  end

  def chessboard(n)
    (1..n).each do |p|
      puts "#{ p } SEEDS = TOTAL #{ total(p) }"
    end
  end

end

seed = Seedy.new
p seed.chessboard(4)



