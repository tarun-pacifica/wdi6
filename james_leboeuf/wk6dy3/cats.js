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
var catWalk = function () {
  var img = document.getElementById('cat');
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + movePixels) + 'px';
  if (currentLeft > (window.innerWidth-img.width)) {
    img.style.left = '0px';
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



















