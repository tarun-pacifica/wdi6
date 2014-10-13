/* 
Currency Converter App
Objectives:

create and use variables
create and use functions
HTF

Find the exchange rate between dollars and pounds
Store the exchange rate in a variable
Converting dollars to pounds:

Store a dollar amount into a variable.
Convert it to pounds and output "$NN is £NN".
Converting pounds to dollars:

Now store a pound amount into a variable.
Convert it to dollar and output "£NN is $NN."
Cleaning it up:

Can you make sure the output is only 2 decimal places?
Refactoring

Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
Do the same for poundsToDollars

1 United States Dollar (USD) is equal to 0.6204 British Pound (GBP)
1 British Pound (GBP) is equal to 1.6118 United States Dollar (USD)
*/

// var exchangeRate = 0.6204;
// var dollarAmount = 1;
// var conversion = dollarAmount * exchangeRate;
// var result = "$" + dollarAmount + " is £" + conversion;
// console.log(result);

// var pountAmount = 1;
// var exchangeRate = 1.6118;
// var conversion = pountAmount * exchangeRate;
// var result = "£" + pountAmount + " is $" + conversion;
// console.log(result);


var dollarsToPounds = function dollarsToPounds(dollars) {
  var pounds = dollars * 0.6204;
  console.log("$" + dollars + " is £" + pounds);
};

dollarsToPounds(5);

var poundsToDollars = function poundsToDollars(pounds) {
  var dollars = pounds * 1.6118;
  console.log("£" + pounds + " is $" + dollars);
};

poundsToDollars(5);

















