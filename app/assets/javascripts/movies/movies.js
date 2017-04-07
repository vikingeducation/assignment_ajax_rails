var MovieModule = (function(){

  var _$movieList = $('#movie-list');

  var _addMovieElement = function(movie){
    var $fullRow = $('<tr></tr>'),
        $title = $('<td></td>').text(movie.title),
        cleanedDate = _cleanDate(movie.release_date),
        $releaseDate = $('<td></td>').text(cleanedDate);

        $fullRow.append($title)
                .append($releaseDate);

    $('#movie-list').prepend($fullRow);
  };

  var _populateList = function(moviesJSON){
    moviesJSON.forEach(function(movie){
      _addMovieElement(movie);
    });
  };

  var _cleanDate = function(timeObj){
    return timeObj.split('T')[0];
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
