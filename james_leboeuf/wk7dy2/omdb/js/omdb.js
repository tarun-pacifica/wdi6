$(document).ready(function (){
  $('#search').on('click', function (e){
    e.preventDefault();
    searchOmdb();
  })
  $('#movieTitle').on('click', '.movieClass', function (e){ // delegation since we used '.movieClass' in the middle 
    e.preventDefault();
    searchOmdbWithI();
  });
});

// var poster = result.Poster;
//   $('#poster img').attr("src", poster);
// }

var searchOmdb = function () {
  var query = $('#query').val();
  var encodedUrl = encodeURI(query);
  var omdbUrl = 'http://www.omdbapi.com/?s=';
  var titleSearch = (omdbUrl + encodedUrl);
  $.ajax(titleSearch).done(function (result){
    manyMoviesResult = result;
  }, processMovies);
}

var searchOmdbWithI = function () {
  debugger;
  var movieID = this.imdbID;
  var omdbUrlWithI = 'http://www.omdbapi.com/?i=';
  var movieSearch = (omdbUrlWithI + movieID);
  $.ajax(movieSearch).done(function (singleMovie){
    singleMovieResult = singleMovie;
  })
}

var processMovies = function () {
  var x = eval('('+manyMoviesResult+')');
  $.each(x.Search, function() {
    // $a = $('</a>')
    var $a = $('<a></a>', {href: '#'});
    var $p = $('<p></p>');
    $a.html(this.Title).addClass('movieClass');
    $p.appendTo('#movieTitle');
    $a.appendTo($p);
      // var movie = $('<p></p>').text(this.Title).appendTo('#movieTitle');
  });

}

// .attr("href", "http://www.google.com")


// homepage. type in true grit. search gets you the poster. 
// put in many other search parameters.
// show a list of the movies if their are multiple.
// see multiple movies as posters.
// get posters for each individual request.
// click on poster and that gives actual result.