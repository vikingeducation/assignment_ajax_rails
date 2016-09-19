var AJAX = {}

var MoviesView = (function () {
  var _$movieTable;

  var init = function() {
    _cacheDOM();
  };

  var _cacheDOM = function() {
    _$movieTable = $('[data-movies-table]').eq();
    console.log("DOM element: " + _$movieTable);
    AJAX.movies.getMovies(_fillMoviesTable);
  };

  var _fillMoviesTable = function(response) {
    console.log(response);
  }
  

  return {
    init: init,
  }

})();

AJAX.movies = (function() {

  var getMovies = function(callback) {
    $.ajax({
      url: "/movies.json",
      method: "GET",
      dataType: "json",
      success: callback
    });
  }

  return {
    getMovies: getMovies
  }

})();