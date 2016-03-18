
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
        //must call add movieToList
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
    var data = JSON.stringify({title: title});

    $.ajax({
      method: "POST",
      url: "http://localhost:3000/movies.json",
      data: data,
      success: function(data){
        showMovieListMovies();
      } 
      error: function(){
        alert('Could not add your movie.');
    })
  };

  var addMovieToList= function(movie){
    console.log(movie);
    var title = movie.title;
    var release_date = movie.release_date;

    var $newMovie = $("<tr><td id='movie-title'>" + title + "</td><td id='release_date'>" + release_date + "</td></tr>");

    var('#movie-list').append($(newMovie));
  }

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
    } 
    else {
      Movies.showNoMovies();
   }

   $('#movie-form').submit( function(e){
        var movieTitle = $(this.find("#title").val());
        console.log(moveTitle);
        Movies.createMovie(movieTitle) );
      }



 });
 

