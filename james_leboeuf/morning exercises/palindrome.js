// Returns an array of palindromic numbers in the range:
//  (lo * lo) <= n <= (hi * hi)


var findPalindromes = function (lo, hi) {
  var palindromes = [],
  // Helper function
  var isPalindrome = function (n) {
    return n.toString() === n.toString().split('').reverse().join();
  };

  for(var i = lo; i <= hi; i++){
    for(var j = lo; j <= hi; j++){
      var product = i * j;
      // Have we already got this palindrome?
      if (palindromes.indexOf(product) != -1) {
        continue;
      }

      if (isPalindrome(product)) {
        palindromes.push(product;)
      }
    }
  }

  return palindromes.sort();
};

console.log(findPalindromes(0,99));