var AJAX = {}

var MoviesView = (function () {
  var _$movieTable;

  var init = function() {
    _cacheDOM();
  };

  var _cacheDOM = function() {
    _$movieTable = $('[data-movies-table]');
    console.log("DOM element: " + _$movieTable);
    AJAX.movies.getMovies(_fillMoviesTable);
  };

  var _fillMoviesTable = function(response) {
    response.forEach(function(row) {
      var newRow = $('<tr>');
      var newTitle = $('<td>').text(row.title);
      var newReleaseDate = $('<td>').text(row.release_date);
      newRow.append(newTitle);
      newRow.append(newReleaseDate);
      newRow.appendTo(_$movieTable);
      // _$movieTable.append();
    });
  };


  return {
    init: init,
  };

})();

AJAX.movies = (function() {

  var getMovies = function(callback) {
    $.ajax({
      url: "/movies.json",
      method: "GET",
      dataType: "json",
      success: callback
    });
  };

  return {
    getMovies: getMovies
  };

})();
