/*
<p>Move the above code into a separate JS file!
<p>Add an event listener to the start button, so that the cat starts moving across the screen when its clicked.
<p>Add an event listener to the stop button, so that the cat stops moving when clicked.
<p>Add an event listener to the speed button, so that the cat moves faster when it's clicked. 
<p>When the cat reaches the edge of the screen, have her walk back to the start. Repeat forever.
<p>Make sure your code works even when the screen is resized (you will need to find the window width with Javascript.
<p>BONUS: When the cat reaches half way, have her stop and replace the image with a dancing cat gif for a moment, then resume.
*/
var movePixels = 10;
var delayMs = 50;
var catTimer = null;

var startButton = document.getElementById('start-button');
var stopButton = document.getElementById('stop-button');
var speedButton = document.getElementById('speed-button');

var catWalk = function catWalk() {
  var img = document.getElementsByTagName('img')[0];
  var currentLeft = parseInt(img.style.left);
  img.setAttribute('width', img.width+10);
  img.style.left = (currentLeft + movePixels) + 'px';
  if (currentLeft > (window.innerWidth-img.width)) {
    img.style.left = '0px';
  } else if(currentLeft === (window.innerWidth)) {
    img.style.left = -movePixels + 'px';
  }
}
var startCatWalk = function startCatWalk() {
  catTimer = window.setInterval(catWalk, delayMs);
}

var speedCatWalk = function(){
  speedCat = window.setInterval(catWalk, delayMs + 10);
}

// var makeImageBigger = function() {
//   x = window.setInterval(catImage, 1000); // Turned var x into x because of scoping issue. If it's var x it can't be called outside of the function.
// }

var stopCat = function() {
  stopCat = window.clearInterval(catTimer);
  stopSpeedCat = window.clearInterval(speedCat);
}

startButton.addEventListener('click', startCatWalk);
speedButton.addEventListener('click', speedCatWalk);
stopButton.addEventListener('click', stopCat);


















