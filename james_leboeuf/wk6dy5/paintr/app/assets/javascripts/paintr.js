var $canvas = $("#canvas");
var mouseDown = false;

var addColor = function () {
  var color = $('#color').val();
  hexColor = color;

  var $box = $('<div/>');
  $box.addClass('box');
  $box.css('background-color', color);
  $('#colors').prepend($box);

};

var setColor = function () {
  var color = $(this).css('background-color');
  $('#current_color').css('background-color', color);
  $('#hexValue').empty().append(hexColor);
  $('#rgbValue').empty().append(color);
};


var paintPixel = function () {
  if (mouseDown) {
    console.log(this);
    var color = $('#current_color').css('background-color');
    $(this).css('background-color', color);
  };
};

$(document).ready(function () {
  $('#add_color').on('click', addColor);
  $('#colors').on('click', '.box', setColor); // Delegation!
  $('#canvas').mousedown(function(){
    mouseDown = true;
    }).mouseup(function(){
      mouseDown = false;
    }).mouseleave(function(){
      $("#canvas").mouseup();
  });
  $('#canvas').on('mouseover', '.pixel', paintPixel);
  var pixels = '';
  for(var i = 0; i < 10000; i++) {
    pixels += '<div class="pixel"></div>';
  }
  $('#canvas').append(pixels);
});





