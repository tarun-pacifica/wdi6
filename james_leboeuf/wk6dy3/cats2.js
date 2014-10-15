// Canvas
var canvas = document.getElementById('canvas');
// Here you first create a variable called canvas and initialize it by fetching the <canvas> element in your markup. You then get a 2d drawing context for the canvas. This provides methods for drawing objects on the canvas as well as controlling the styling of those objects.

// 2d Drawning Context.
var ctx = canvas.getContext('2d');

function setupAnimCanvas() {
    var canvas = document.getElementById('canvas');
    if (canvas.getContext) {
        ctx = canvas.getContext('2d');
        //setInterval('draw();', 20); //don't use this
        img = new Image();
        img.onload = function(e) {
            draw();          //use this instead..
        }
        img.src = '../images/dragon.png';
        //animation();
        draw(); //as we don't have an image to load, call here
                //remove when image is used instead
    }
}

// Set fill style for drawing context.
ctx.fillStyle = '#02ef00';
// The next line of code sets the fillStyle property on the drawing context to #212121.


// A variable to store the RequestID.
var RequestID;
// The requestID variable will be used to keep track of the requestID returned by the requestAnimationFrame method.


// Variables for the drawing position and object.
var posX = 0;
var boxWidth = 30;
var pixelsPerFrame = 5; // How many pixels the box should move per frame.
// The posX, boxWidth, and pixelsPerFrame variables are used to set the position the box should be drawn on the canvas; the width of the box; and the number of pixels the box should be moved in each frame.



// Draw the initial box on the canvas.
ctx.fillRect(posX, 0, boxWidth, canvas.height);

// Animate.
function animate() {
  requestID = requestAnimationFrame(animate);

  // If the box has not reached the end draw on the canvas.
  // Otherwise stop the animation.
  if (posX <= (canvas.width - boxWidth)) {
    ctx.clearRect((posX - pixelsPerFrame), 0, boxWidth, canvas.height);
    ctx.fillRect(posX, 0, boxWidth, canvas.height);
    posX += pixelsPerFrame;
  } else {
    cancelAnimationFrame(requestID);
  }
}
//The call to requestAnimateFrame at the top of this function will schedule the next animation frame. This is placed first so that we can get as close to 60FPS as possible when using the setTimeout fallback provided by the polyfill.

// You then have an if statement that checks to see if the box has reached the right side of the canvas. If the box has not yet reached the end you use the clearRect method to remove the box drawn in the previous frame and then draw the box at it’s new position using fillRect. If the box has reached the end of the canvas, you call cancelAnimationFrame in order to cancel the frame scheduled at the start of the animate function. Finally, you update the posX variable with the position that the box should be drawn in the next frame.


var startBtn = document.getElementById('startBtn');
var stopBtn = document.getElementById('stopBtn');
var resetBtn = document.getElementById('resetBtn');

// Event listener for the start button.
startBtn.addEventListener('click', function(e) {
  e.preventDefault();

  // Start the animation.
  requestID = requestAnimationFrame(animate);
});

// Event listener for the stop button.
stopBtn.addEventListener('click', function(e) {
  e.preventDefault();

  // Stop the animation;
  cancelAnimationFrame(requestID);
});

// Event listener for the reset button.
resetBtn.addEventListener('click', function(e) {
  e.preventDefault();

  // Reset the X position to 0.
  posX = 0;

  // Clear the canvas.
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Draw the initial box on the canvas.
  ctx.fillRect(posX, 0, boxWidth, canvas.height);
});





























(function() {
    var lastTime = 0;
    var vendors = ['ms', 'moz', 'webkit', 'o'];
    for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
        window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
        window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame'] 
                                   || window[vendors[x]+'CancelRequestAnimationFrame'];
    }
 
    if (!window.requestAnimationFrame)
        window.requestAnimationFrame = function(callback, element) {
            var currTime = new Date().getTime();
            var timeToCall = Math.max(0, 16 - (currTime - lastTime));
            var id = window.setTimeout(function() { callback(currTime + timeToCall); }, 
              timeToCall);
            lastTime = currTime + timeToCall;
            return id;
        };
 
    if (!window.cancelAnimationFrame)
        window.cancelAnimationFrame = function(id) {
            clearTimeout(id);
        };
}());