
var lines = {
  n: [
    "Times Square", 
    "34th on N", 
    "28th on N", 
    "23rd on N", 
    "Union Square", 
    "8th on N"
  ],
  l: [
    "8th on L", 
    "6th on L", 
    "Union Square", 
    "3rd on L", 
    "1st on L"
  ],
  six: [
    "Grand Central", 
    "33rd on Six", 
    "28th on Six", 
    "23rd on Six", 
    "Union Square", 
    "Astor Place"
  ]
};

var $select = $("<select></select>");
$("#menu").append($select);

$.each(lines, function(line, station) {
  var $option = $("<option>"+ station +"</option>");
  $select.append($option);
});








// var find_line = function find_line(station, all_the_lines) {

// }

 // if value is IN the array, then yield below as line with the stationNumber, otherwise, false.
    // IndexOf gets the position of an item in an array, if it's not in there, it returns -1. We said, if it's over -1, return i.

var foundStation = function(val) {
  for (var line in lines) {
    if (lines[line].indexOf(val) > -1){
      return line; // Returning line.
    }
  }
};

// create a function for the distances between the same lines. Sub in union square when the want to exchange lines.

var stopsDistance = function(stopA, stopB, line) {
  var distance = Math.abs(lines[line].indexOf(stopA) - lines[line].indexOf(stopB)); // Basically doing the found station logic for stopA and stopB. (lines[line].indexOf(stopA)) <--- The lines is from the HUGE array from above. the [line] is the argument stated in the function(.....,...., line) and there were finding the index of the given stopA and stop B.
  return distance;
};

// make function that only has two stops
var distanceBetweenStops = function(stopA, stopB) {
  var lineA = foundStation(stopA); // Finding the station of stopA.
  var lineB = foundStation(stopB); // Finding the station of stopB.
  if (lineA === lineB) {
    return stopsDistance(stopA, stopB, lineA);
  } else {
    var distanceA = stopsDistance(stopA, "Union Square", lineA);
    var distanceB = stopsDistance("Union Square", stopB, lineB);
    return distanceA + distanceB;
  }
};


// make a function to find the line

// make a function to claculate the distance between two stops 


// make a function that finds the distance between stops 
  // find the line of each stop
  // see if its on the same line
  // if it isnt, calculate distnace to union square, otherwise just calculate distance btween stops










// if lines are the same, if they are not the same, do this.

















