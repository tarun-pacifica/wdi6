# Seeds
# There once was a wise servant who saved the life of a prince. The king promised to pay whatever the servant could dream up. Knowing that the king loved chess, the servant told the king he would like to have seeds. One seed on the first square of a chess board. Two seeds on the next. Four seeds on the third, and so on. There are 64 squares on a chessboard.

# Write a program that shows

# how many seeds were on each square, and
# the total number of seeds

def number_of_seeds(boardsquare)
  2 ** (boardsquare - 1)
end

def total_seeds(seeds)
  (1..seeds).inject { |sum, number| sum + number_of_seeds(number)}
end


p total_seeds(64)




