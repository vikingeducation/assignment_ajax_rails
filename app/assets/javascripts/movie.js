
Movies = (function(){

  var showMovieList= function() {
    var url = "http://localhost:3000/movies.json";
    
    var callback = function(data) {
      var $movieList = $('#movie-list');

      data.forEach( function(elt){
        var $movieTableRow = $('<tr></tr>')
        $movieList.prepend($movieTableRow);
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

  var createMovie= function( title ) {
    var data = {title: title};

    $.ajax({
      method: "POST",
      url: "http://localhost:3000/movies.json",
      data: data,
      dataType: 'json',
      success: function(data){
        Movies.addMovieToList(data);
      }, 
      error: function(){
        alert('Could not add your movie.');
      },
    });
  };

  var addMovieToList = function(data){
    var title = data.title;
    var release_date = data.release_date;

    var $newMovie = $("<tr><td id='movie-title'>" + data.title + "</td><td id='release_date'>" + data.release_date + "</td></tr>");

    $('#movie-list').prepend($newMovie);
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
    addMovieToList: addMovieToList
  };

})();

$(document).ready(function(){
   if($('#movies-index').length){
      Movies.showMovieList();
    } 
    else {
      Movies.showNoMovies();
   }

   $('#movie-form').submit( function(e){
        e.preventDefault();
        var movieTitle = $(this).find("#title").val();
        Movies.createMovie(movieTitle);
    });
 });
 

