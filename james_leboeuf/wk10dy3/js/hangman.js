// Hangman LAB

// The Hangman Game:

// The game selects a random word from a word list and makes that the secret word
// The player guesses one letter at a time, trying to figure out what the word is
// If the player guesses correctly, any instances of that letter are revealed in the secret word
// If the player guesses incorrectly, they are penalized by taking away a guess
// If a player reveals all of the letters of the secret word, they win
// If a player makes 8 incorrect guesses before solving the secret word, they lose
// To do:

// Plan out your object model. What variables and functions will each object have? How will the different objects communicate with each other?
// Get the logic to work and make sure you have the game working in the console first before translating it over to update the DOM.
// Translate your game over so it updates the DOM.
// Once you get the game working:
// Implement a "reset" button that will reset the game and choose a new word
// Implement a "give up" button that will show the solution
// Are there ways to refactor your code to make it DRYer?
// Bonus:

// Validate the input so that only single letters are accepted as guesses
// Change the input format so that there is no text field. You can get input by "listening" to the keyup event and figuring out which key was pressed.
// Draw the hanged man guy using CSS
// Animate the actual moment of execution with frighteningly gruesome detail
// Implement a "hint" button that will reveal one of the letters in the word
// Provide a backend to keep track of scores, and an admin to manage the list of possible words.

// var words = ['cat', 'tree', 'swing', 'around', 'scientist'];
// var words = ['cat'];

// This function will pick our word
// var sampledRandomWord = _.sample(words);

// var answer = sampledRandomWord.replace(/[A-z]/g, "#");

// var guessWord = function (letter) {
//   // Determine if secretWord contains the letter guessed
//   var result = _.contains(secretWord, letter);

//   // Create a way to reveal letter after a correct guess
//   if (result === true){
//     console.log(letter);
//   }
// }

// var results = [];
// var space = 0;

// // Create results ul
// var result = function () {
//     for (var i = 0; i < answer.length; i++) {
//         var correct = document.getElementById('result');
//         var choice = document.createElement('li');
//         choice.setAttribute('id', 'choice');
//         if (answer[i] === "#") {
//             choice.innerHTML = "#";
//             space += 1;
//         } else {
//             choice.innerHTML = "_";
//         }
//         results.push(choice);
//         correct.appendChild(choice);
//         // correct.appendChild('tits');
//     }
// }
// result();




/////// jquery practice //////////

// 2 - The Basics - Events-201 

$(document).ready(function() {


  // filter selection down. 
  // only want nth child n + 4. only those that have that critera will get addClass.
  // only select the 4th one minimum, then select n + 4, 
  // the addClass was defined in the CSS file.
  $('dd').filter(':nth-child(n+4)').addClass('hide');

  // attach to dl/definition list, provide selector string, so we can specify exactly what were looking for.
  // when the user hovers over a definition list, we pass a selector string, that says 'jquery, were only interested in the condition target is a DT/defintion term.' if it's anything else, ignore it.
  $('dl').on('mouseenter', 'dt', function(){
    $(this)
      .next()
        .slideDown(200)
        .siblings('dd')
            .slideUp(200);
  });
});


// 2 - The Basics - Creating and appending content to the Dom
// $(document).ready(function() {

//   // Pass a function, and whatever is returned will be used.
//   var co = $('article span.co').each(function(){
//     $('<blockquote></blockquote>',{
//       class: 'co',
//       text: $(this).text()
//     }).prependTo( $(this).closest('p') );
//   });
//   // $('h1').appendTo('article');
// });


















