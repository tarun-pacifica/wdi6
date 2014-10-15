// var movePixels = 10;
// var delayMs = 50;
// var catTimer = null;
// var catWalk = function () {
//   var img = document.getElementById('eagle');
//   var currentLeft = parseInt(img.style.left);
//   img.style.left = (currentLeft + movePixels) + 'px';
//   if (currentLeft > (window.innerWidth-img.width)) {
//     img.style.left = '0px';
//   }
// }

// var startCatWalk = function() {
//   catTimer = window.setInterval(catWalk, delayMs);
// }

// var speedCatWalk = function() {
//   speedCatTimer = window.setInterval(catWalk, movePixels);
// };

// var stopCatWalk = function() {
//   stopCat = window.clearInterval(catTimer);
//   stopSpeedCat = window.clearInterval(speedCatTimer);
// }

// startButton = document.getElementById('start-button');
// speedButton = document.getElementById('speed-button');
// stopButton = document.getElementById('stop-button');

// startButton.addEventListener('click', startCatWalk);
// speedButton.addEventListener('click', speedCatWalk);
// stopButton.addEventListener('click', stopCatWalk);