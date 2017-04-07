var MovieModule = (function(){

  var _$movieList = $('#movie-list');

  var _addMovieElement = function(movie){
    var $fullRow = $('<tr></tr>'),
        $title = $('<td></td>').text(movie.title);
        $releaseDate = $('<td></td>').text(movie.release_date),
        $fullRow.append($title)
                .append($releaseDate);

    $('#movie-list').prepend($fullRow);
  };

  var _populateList = function(moviesJSON){
    moviesJSON.forEach(function(movie){
      _addMovieElement(movie);
    });
  };

  var getMovies = function(){
    $.ajax({
      url: "/movies",
      method: "GET",
      dataType: "json",
      success: function(moviesJSON){
        _populateList(moviesJSON);
      }

    });
  };

  return {
    getMovies: getMovies
  };

}());


$(document).ready(function(){
  MovieModule.getMovies();
});
