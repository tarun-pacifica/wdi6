$(document).ready(function (){
  $('#search').on('click', function (e){
    e.preventDefault();
    searchOmdb();
  })
});

var searchOmdb = function () {
  var query = $('#query').val();
  var encodedUrl = encodeURI(query);
  var omdbUrl = 'http://www.omdbapi.com/?s=';
  var titleSearch = (omdbUrl + encodedUrl);
  $.ajax(titleSearch).done(function (result){
    manyMoviesResult = result;
  }, processMovies);
}

var processMovies = function () {

  var x = eval('('+manyMoviesResult+')');
  $.each(x.Search, function() {
    console.log(this);
  });

}




// homepage. type in true grit. search gets you the poster. 
// put in many other search parameters.
// show a list of the movies if their are multiple.
// see multiple movies as posters.
// get posters for each individual request.
// click on poster and that gives actual result.