/*
  <article>
<p>Move the above code into a separate JS file!
<p>Add an event listener to the start button, so that the cat starts moving across the screen when its clicked.
<p>Add an event listener to the stop button, so that the cat stops moving when clicked.
<p>Add an event listener to the speed button, so that the cat moves faster when it's clicked. 
<p>When the cat reaches the edge of the screen, have her walk back to the start. Repeat forever.
<p>Make sure your code works even when the screen is resized (you will need to find the window width with Javascript.
<p>BONUS: When the cat reaches half way, have her stop and replace the image with a dancing cat gif for a moment, then resume.
  </article>
  */

var movePixels = 10;
var delayMs = 50;
var catTimer = null;
var rotateY = 0;

var catWalk = function () {
  var img = document.getElementById('cat');
  var currentLeft = parseInt(img.style.left); // Our image position is set in absolute. Because it's absolute we can give it any position. Abolsute positioning makes images/objects/divs/text dynamic. Because it's dynamic we can give it any positioning: left: 0px, left: 20px, etc... parseInt makes '20px' from a string to an integer 20.
  var newLeft = currentLeft + movePixels; // Created and assigned new variable to get a new value, 0 + 10(movePixels)
  img.style.left = newLeft + 'px'; // Resetting the .left position of the cat to 'left:10px' and adding + 'px' to turn it back into a string so it reads on the html.

  if ((currentLeft > (window.innerWidth-img.width)) || (currentLeft < 0)) { // Check if the cat's current position is > than the edge of the right side of the screen OR if the cat's current position is less than left edge of the screen.
    rotateY = (rotateY + 180) % 360; // 0 
    movePixels = -movePixels;
    img.style.transform = 'rotateY(' + rotateY + 'deg)';
  }
}

var startCatWalk = function() {
  catTimer = window.setInterval(catWalk, delayMs);
}

var speedCatWalk = function() {
  speedCatTimer = window.setInterval(catWalk, movePixels);
};

var stopCatWalk = function() {
  stopCat = window.clearInterval(catTimer);
  stopSpeedCat = window.clearInterval(speedCatTimer);
}

startButton = document.getElementById('start-button');
speedButton = document.getElementById('speed-button');
stopButton = document.getElementById('stop-button');

startButton.addEventListener('click', startCatWalk);
speedButton.addEventListener('click', speedCatWalk);
stopButton.addEventListener('click', stopCatWalk);



















