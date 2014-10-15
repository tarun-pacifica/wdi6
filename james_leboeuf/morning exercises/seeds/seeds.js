/*
def total_seeds(seeds)
  (1..seeds).inject { |sum, number| sum + number_of_seeds(number)}
end
*/


var numberOfSeeds = function(square) {
  Math.pow(2, (square - 1));
};





