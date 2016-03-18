
Movies = (function(){

  var showMovieList= function() {
    console.log('show movie list im here');
    var url = "http://localhost:3000/movies.json";
    
    var callback = function(data) {
      // console.dir(data);
      var $movieList = $('#movie-list');

      data.forEach( function(elt){
        var $movieTableRow = $('<tr></tr>')
        $movieList.prepend($movieTableRow);
        console.log(elt);
        var $movieTDElt = $('<td>' + elt.title + '</td><td>' + elt.release_date + '</td>');
        $movieTableRow.prepend($movieTDElt);
      })
    };

    var errorCallback = function(xhr, status, err){
      console.log(status);
      console.log(err);
    }

    $.ajax( {
      url: url, 
      success: callback,
      error: errorCallback,
    } );
  };

  var createMovie= function(e) {
    console.log('create movie im here');
    e.preventDefault();
    console.log(e)
  };

  var showNoMovies = function() {
    var $movieList = $('#movie-list');
    var $noMovies = $('<p>No movies to show</p>');
    $movieList.append($noMovies);
  };

  return {
    showMovieList: showMovieList,
    createMovie: createMovie,
    showNoMovies: showNoMovies,
  };

})();

$(document).ready(function(){
   if($('#movies-index').length){
      Movies.showMovieList();
      $('#movie-form').submit( Movies.createMovie );
   } else {
      Movies.showNoMovies();
   }

 });
 

