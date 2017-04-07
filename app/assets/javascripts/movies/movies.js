var MovieModule = (function(){

  var _$movieList = $('#movie-list');

  var _addMovieElement = function(movie){
    var $fullRow = $('<tr></tr>'),
        $title = $('<td></td>').text(movie.title),
        // cleanedDate = _cleanDate(movie.release_date),
        cleanedDate = movie.release_date,
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

  var _getMovies = function(){
    $.ajax({
      url: "/movies",
      method: "GET",
      dataType: "json",
      success: function(moviesJSON){
        _populateList(moviesJSON);
      }
    });
  };

  var _attachFormListener = function(){
    $("form[data-ajaxremote='true']").submit(function(event){
      event.preventDefault();

      var $el = $(event.target),
          $formData = $el.serializeArray();

          window.xx = $el
          window.yy = $formData

      _ajaxCreateMovie();
    });
  };

  var _ajaxCreateMovie = function(){
    $.ajax({
      url: $el.attr("action"),
      method: "POST",
      dataType: "json",
      success: function(movie){
        window.aa = movie
        _addMovieElement(movie);
      }
    });
  };

  var init = function(){
    _getMovies();
    _attachFormListener();
  };

  return {
    init: init
  };

}());


$(document).ready(function(){
  MovieModule.init();
});
