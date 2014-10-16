// Find the exchange rate between dollars and pounds
// Store the exchange rate in a variable
// Converting dollars to pounds:

// Store a dollar amount into a variable.
// Convert it to pounds and output "$NN is £NN".
// Converting pounds to dollars:

// Now store a pound amount into a variable.
// Convert it to dollar and output "£NN is $NN."
// Cleaning it up:

// Can you make sure the output is only 2 decimal places?
// Refactoring

// Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
// Do the same for poundsToDollars

var GBPtoAUD = 1.8449;
var AUDtoGBP = 0.54203;

// Convert to Pounds
var convertToGBP = function(dollars) {
	resultInGBP = dollars * AUDtoGBP;
	return resultInGBP.toFixed(2);
}

var AUDamount = prompt("How much AUD do you want to convert into GBP?");
console.log("$" + AUDamount + " is £" + convertToGBP(AUDamount));

// Convert to Dollars
var convertToAUD = function(pounds) {
	resultInAUD = pounds * GBPtoAUD;
	return resultInAUD.toFixed(2);
}

var GBPamount = prompt("How much GBP do you want to convert into AUD?");
console.log("£" + GBPamount + " is $" + convertToAUD(GBPamount));
