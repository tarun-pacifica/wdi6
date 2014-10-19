var $canvas = $("#canvas");
var mouseDown = false;


var addColor = function () {
  var color = $('#color').val();
  var $box = $('<div/>');
  $box.addClass('box');
  $box.css('background-color', color);
  $('#colors').prepend($box);
};

var setColor = function () {
  var color = $(this).css('background-color');
  $('#current_color').css('background-color', color);
};



var paintPixel = function () {
  var color = $('#current_color').css('background-color');
  $(this).css('background-color', color);
};

$(document).ready(function () {
  $('#add_color').on('click', addColor);
  $('#colors').on('click', '.box', setColor); // Delegation!
  // $('#canvas').on('mousemove', '.pixel', paintPixel);
  $("#canvas").mousedown(function(){
  mouseDown = true;
    }).mousemove(function(){
      if (mouseDown) {
        $("#canvas").append('.pixel', paintPixel);
      }
    }).mouseup(function(){
      mouseDown = false;
    }).mouseleave(function(){
      $("#canvas").mouseup();
    });
  var pixels = '';
  for(var i = 0; i < 10000; i++) {
    pixels += '<div class="pixel"></div>';
  }
  $('#canvas').append(pixels);
});





