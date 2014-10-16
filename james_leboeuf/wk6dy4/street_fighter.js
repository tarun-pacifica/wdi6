$(document).ready(function() {
  $(".ryu .ryuImage").mousedown( function() {
    this.src = 'http://i.imgur.com/Rfj0a80.png'
  })
  $('.ryu .ryuImage').mousedown(function() {
      $('.hadouken').remove();
  })
  $(".ryuImage").mousedown( function() {
    $(".ryu").append(
      '<img class="hadouken" src="http://i.imgur.com/oTyQRvX.gif">'
      )
  })
  $(".ryuImage").mousedown(function () {
    $('.hadouken').animate( {
      "margin-left": "80em"
    }, 1000, 'swing', function() {
      this.remove(); // We then fire a function once the animation has been completed. This function selects 'this' element (referring to the demo-hadouken) and removes it.
    })
  })
  $(".ryu .ryuImage").mouseup(function(){
    this.src = 'http://i.imgur.com/nTj3Fxx.gif'
  })
// #################################################
// Akuma
  $(".akuma .akumaImage").mousedown( function() {
    this.src = 'http://img3.wikia.nocookie.net/__cb20110811232711/streetfighter/images/6/62/Akuma-hdshoosh.gif'
  })
  $('.akuma .akumaImage').mousedown(function() {
      $('.akumaHadouken').remove();
  })
  $(".akumaImage").mousedown( function() {
    $(".akuma").prepend(
      '<img class="akumaHadouken" src="http://i.imgur.com/oTyQRvX.gif">'
      )
  })
  $(".akumaImage").mousedown(function () {
    $('.akumaHadouken').animate( {
      "margin-right": "90em"
    }, 1000, 'swing', function() {
      this.remove(); // We then fire a function once the animation has been completed. This function selects 'this' element (referring to the demo-hadouken) and removes it.
    })
  })
  $(".akuma .akumaImage").mouseup(function(){
    this.src = 'http://img3.wikia.nocookie.net/__cb20100718225543/streetfighter/images/8/8c/Akuma-hdstance.gif'
  })
});




