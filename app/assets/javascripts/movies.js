var AJAX = {}

var MoviesView = (function () {
  var _$movieTable;
  var _$newMovieForm;

  var init = function() {
    _cacheDOM();
    _handleAjaxForm();
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
    });
  };

  var _handleAjaxForm = function () {
    _$newMovieForm = $('[data-ajaxremote]');
  };

  var listeners = {
    onSubmit: function() {

    }
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
