// The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

// There are 3 subway lines:
// The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
// The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
// The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
// All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)

// Prompts to collect answers 
var first_line = prompt("Which line would you like to catch? N / L / 6").toUpperCase();
var first_station = prompt("Which station do you want to embark at on line " + first_line + "?").toUpperCase();
var second_line = prompt("Which line would you like to disembark to? N / L / 6").toUpperCase();
var second_station = prompt("Which station would you like to disembark at on line " + second_line + "?").toUpperCase();

// Array of stations

var mta = {
	line_N: ["Times Square".toUpperCase(), "34th".toUpperCase(), "28th".toUpperCase(), "23rd".toUpperCase(), "Union Square".toUpperCase(), "8th".toUpperCase()],
	line_L: ["8th".toUpperCase(), "6th".toUpperCase(), "Union Square".toUpperCase(), "3rd".toUpperCase(), "1st".toUpperCase()],
	line_6: ["Grand Central".toUpperCase(), "33rd".toUpperCase(), "28th".toUpperCase(), "23rd".toUpperCase(), "Union Square".toUpperCase(), "Astor Place".toUpperCase()]
}

// Converting prompts into variables names to be called later
var first_line_name = "line_" + first_line  
var second_line_name = "line_" + second_line 

// Console declarations
console.log("You are getting on at " + first_line_name + " on station " + first_station)
console.log("You are disembarking on at " + second_line_name + " on station " + second_station)

// Logic part
if (first_line === second_line) {
	if (first_station === second_station) {
		
		console.log("You should not be catching a train! You are already at this station.")

	} else {

		var station_number_embarking = mta[first_line_name].indexOf(first_station)
		var station_number_disembarking = mta[first_line_name].indexOf(second_station)
		var number_of_stations = station_number_disembarking - station_number_embarking
		var num_of_stations_abs = Math.abs(number_of_stations)

		console.log("You need to pass through " + num_of_stations_abs + " stations from " + first_station + " to " + second_station)

		var stop_number = 1
		if(number_of_stations == num_of_stations_abs ) {
			for (var i = station_number_embarking; i < station_number_disembarking; i++ ) {
					console.log("Station "+ stop_number++ + ": " + mta[first_line_name][i+1])
			}
		} else {
			for (var i = station_number_embarking; i > station_number_disembarking; i-- ) {
					console.log("Station: " + stop_number++ + ": " + mta[first_line_name][i-1]) 
			}
		}
	}
} else if (first_station === "UNION SQUARE") {
	
	console.log("Does not make sense for you to change trains if you're at Union Square.")

		var station_number_embarking = mta[second_line_name].indexOf(first_station)
		var station_number_disembarking = mta[second_line_name].indexOf(second_station)
		var number_of_stations = station_number_disembarking - station_number_embarking
		var num_of_stations_abs = Math.abs(number_of_stations)

		console.log("You need to pass through " + num_of_stations_abs + " stations from " + first_station + " to " + second_station)

		var stop_number = 1
		if(number_of_stations == num_of_stations_abs ) {
			for (var i = station_number_embarking; i < station_number_disembarking; i++ ) {
					console.log("Station "+ stop_number++ + ": " + mta[second_line_name][i+1])
			}
		} else {
			for (var i = station_number_embarking; i > station_number_disembarking; i-- ) {
					console.log("Station: " + stop_number++ + ": " + mta[second_line_name][i-1]) 
			}
		}

} else if (second_station === "UNION SQUARE") {
	
	console.log("Why are you changing trains when you're getting off at Union Square?")

		var station_number_embarking = mta[first_line_name].indexOf(first_station)
		var station_number_disembarking = mta[first_line_name].indexOf(second_station)
		var number_of_stations = station_number_disembarking - station_number_embarking
		var num_of_stations_abs = Math.abs(number_of_stations)

		console.log("You need to pass through " + num_of_stations_abs + " stations from " + first_station + " to " + second_station)

		var stop_number = 1
		if(number_of_stations == num_of_stations_abs ) {
			for (var i = station_number_embarking; i < station_number_disembarking; i++ ) {
					console.log("Station "+ stop_number++ + ": " + mta[first_line_name][i+1])
			}
		} else {
			for (var i = station_number_embarking; i > station_number_disembarking; i-- ) {
					console.log("Station: " + stop_number++ + ": " + mta[first_line_name][i-1]) 
			}
		}

} else {
	console.log("You are changing subways!")
	
	if (first_station === second_station) {
	
	console.log("Probably makes more sense for you to walk. Don't bother catching the subway.")
	
	} else {
		// EMBARKING STATION
		var station_number_embarking = mta[first_line_name].indexOf(first_station)
		var union_square_number_embarking = mta[first_line_name].indexOf("UNION SQUARE")
		var number_of_stations_embarking = union_square_number_embarking - station_number_embarking
		var num_of_stations_embarking_abs = Math.abs(number_of_stations_embarking)
		
		console.log("On the first line, " + first_line_name + ", you will go through " + num_of_stations_embarking_abs + " stations. The stations you are passing through will be:")
		
			var stop_number = 1
			if(number_of_stations_embarking == num_of_stations_embarking_abs ) {
				for (var i = station_number_embarking; i < union_square_number_embarking; i++ ) {
						console.log("Station "+ stop_number++ + ": " + mta[first_line_name][i+1])
				}
			} else {
				for (var i = station_number_embarking; i > union_square_number_embarking; i-- ) {
						console.log("Station: " + stop_number++ + ": " + mta[first_line_name][i-1]) 
				}
			}

		console.log("Then you will change at Union Square.")

		// DISEMBARKING STATION
		var station_number_disembarking = mta[second_line_name].indexOf(second_station)
		var union_square_number_disembarking = mta[second_line_name].indexOf("UNION SQUARE")
		var number_of_stations_disembarking = union_square_number_disembarking - station_number_disembarking
		var num_of_stations_disembarking_abs = Math.abs(number_of_stations_disembarking)
		console.log("On the second line, " + second_line_name + ", you will go through "+ num_of_stations_disembarking_abs + " stations. The stations you are passing through will be:")

		var stop_number = 1
		if(number_of_stations_disembarking != num_of_stations_disembarking_abs ) {
			for (var i = union_square_number_disembarking; i < station_number_disembarking; i++ ) {
				console.log("Station " + stop_number++ + ": " + mta[second_line_name][i+1])
				}
		} else {
			for (var i = union_square_number_disembarking; i > station_number_disembarking; i-- ) {
				console.log("Station " + stop_number++ + ": " + mta[second_line_name][i-1]) 
			}
		}



		var total_num_of_stations = num_of_stations_embarking_abs + num_of_stations_disembarking_abs
		console.log("Total number of stations to pass through is " + total_num_of_stations + ", from " + first_station + " to " + second_station + ". ")

	}

}
