var AJAX = {}

var MoviesView = (function (AJAX) {
  var _$movieTable;
  var _$newMovieForm;

  var init = function() {
    console.log('This script file is being run');
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
    _$newMovieForm = $('form[data-ajaxremote]');
    console.log(_$newMovieForm);
    _$newMovieForm.submit(listeners.onMoviesFormSubmit);
  };

  var listeners = {
    onMoviesFormSubmit: function(event) {
      event.preventDefault();
      var $form = $(event.target);
      AJAX.movies.postMovies($form, _addMovieRowToTable);
    }
  };

  var _addMovieRowToTable = function(data) {
    console.log("Adding movie row to table");
    var newRow = $('<tr>');
    var newTitle = $('<td>').text(data.title);
    var newReleaseDate = $('<td>').text(data.release_date);
    newRow.append(newTitle);
    newRow.append(newReleaseDate);
    newRow.appendTo(_$movieTable);
  };

  return {
    init: init,
  };

})(AJAX);

AJAX.movies = (function() {

  var getMovies = function (callback) {
    $.ajax({
      url: "/movies.json",
      method: "GET",
      dataType: "json",
      success: callback
    });
  };

  var postMovies = function (form, callback) {
    var formData = form.serializeArray();
    $.ajax({
      url: form.attr("action"),
      method: "POST",
      data: formData,
      dataType: "json",
      success: function(data) {
        callback(data);
      }
    })
  };

  return {
    getMovies: getMovies,
    postMovies: postMovies
  };

})();
