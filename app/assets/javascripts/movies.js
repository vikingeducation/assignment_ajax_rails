$(document).ready(function(){
  MV.MovieModule.init();
});

var MV = MV || {};

MV.MovieModule = (function(){

  function init(){
    _getMovies();
  }

  function _getMovies(){
    console.log("Fetching movies...")
    var response;

    $.ajax({
      url: 'movies.json',
      method: 'GET',
      success: function(json){
        _renderMovies(json);
      }
    });
  }

  function _renderMovies(movies){
    var $tbody = $('tbody[data-content="movies"]');

    movies.forEach(function(movie){
      var $row = $('<tr></tr>')
        .html('<td>' + movie.title + '</td><td>' + movie.release_date + '</td>');

      $tbody.append($row);
    });
  }

  return {
    init: init
  }
})();