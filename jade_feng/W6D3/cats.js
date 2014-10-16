
var movePixels = 10;
var delayMs = 50;
var catTimer = null;
var counter = 1

var img_dance = document.getElementsByTagName('img')[1];
img_dance.style.visibility = 'hidden'


// <p>Add an event listener to the start button, so that the cat starts moving across the screen when its clicked.
var start_button = document.getElementById('start-button');

var catStart = function() {
	var img = document.getElementsByTagName('img')[0];
	var img_dance = document.getElementsByTagName('img')[1];
	
	var oldLeft = parseInt(img.style.left);
 	var newLeft = oldLeft + movePixels;
	img.style.left = newLeft + 'px';
	
	var oldLeft = parseInt(img_dance.style.left);
 	var newLeft = oldLeft + movePixels;
	img_dance.style.left = newLeft + 'px';

  if (newLeft > ( window.innerWidth/2 - img.width/2 ) && newLeft < ( window.innerWidth/2 + img.width/2 ) ) {
  	img_dance.style.visibility = 'visible'
  	img.style.visibility = 'hidden'
  } else if ( (newLeft > window.innerWidth - img.width) || (newLeft < 0) ) {
  	
  	movePixels = movePixels * -1;
 	var newLeft = oldLeft + movePixels;
	img.style.left = (newLeft + movePixels) + 'px';
 	img_dance.style.left = (newLeft + movePixels) + 'px';
 	counter = counter*-1
 	img.style.transform = "scaleX(" + counter +")";
 	img.style.filter = "FlipH"
 	img_dance.style.transform = "scaleX(" + counter +")";
 	img_dance.style.filter = "FlipH"


  } else if (newLeft <= ( window.innerWidth/2 - img.width/2 ) || newLeft >= ( window.innerWidth/2 + img.width/2 ) ){
  	img.style.visibility = 'visible'
  	img_dance.style.visibility = 'hidden'
  	 } 
} 
cat_start_array = [];
var startCatStart = function () {
	catTimer = window.setInterval(catStart, delayMs)
	cat_start_array.push(catTimer);
}
start_button.addEventListener('click', startCatStart)

// <p>Add an event listener to the speed button, so that the cat moves faster when it's clicked. 
var speed_button = document.getElementById('speed-button')

var refreshCatTimer_array = [];
var startCatSpeed = function () {
	delayMs -= 5
	refreshCatTimer = window.setInterval(catStart, delayMs)
	refreshCatTimer_array.push(refreshCatTimer)
}

speed_button.addEventListener('click', startCatSpeed)

// <p>Add an event listener to the stop button, so that the cat stops moving when clicked.
var stop_button = document.getElementById('stop-button')

var stopTheCat = function() {

	for(var i = 0; i<cat_start_array.length; i++) {
	 window.clearInterval(cat_start_array[i])	
	}
	
	for (var i = 0; i < refreshCatTimer_array.length; i++ ) {
		window.clearInterval(refreshCatTimer_array[i]) 
	}
}

stop_button.addEventListener('click', stopTheCat )

// <p>Make sure your code works even when the screen is resized (you will need to find the window width with Javascript.
// <p>BONUS: When the cat reaches half way, have her stop and replace the image with a dancing cat gif for a moment, then resume.

// Running puppy
var puppyTimer = null;
var movePixels_puppy = 10;
var counter_puppy = -1;

var img_puppy = document.getElementsByTagName('img')[2];
var puppyWalk = function() {
	var oldLeft = parseInt(img_puppy.style.left);
 	var newLeft = oldLeft + movePixels_puppy;
	img_puppy.style.left = newLeft + 'px';
  if ( (newLeft > window.innerWidth - img_puppy.width) || (newLeft < 0) ) {
  	movePixels_puppy = movePixels_puppy * -1;
 	var newLeft = oldLeft + movePixels_puppy;
	img_puppy.style.left = (newLeft + movePixels_puppy) + 'px';
 	counter_puppy = counter_puppy*-1
 	img_puppy.style.transform = "scaleX(" + counter_puppy +")";
 	img_puppy.style.filter = "FlipH"
  } 
} 
puppy_event_array = [];
var startPuppyStart = function () {
	puppyTimer = window.setInterval(puppyWalk, delayMs)
	puppy_event_array.push(puppyTimer);
}

window.addEventListener('keypress', function(event) {
	if (event.which === 13) {
		startPuppyStart();
	}
})


// <p>Add an event listener to the stop button, so that the puppy stops moving when clicked.

var stopThePuppy = function() {

	for(var i = 0; i<puppy_event_array.length; i++) {
	 window.clearInterval(puppy_event_array[i])	
	}

}

stop_button.addEventListener('click', stopTheCat )
window.addEventListener('keypress', function(event) {
	if (event.which === 32) {
		stopThePuppy();
	}
})
