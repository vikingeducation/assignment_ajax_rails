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
    _$reviewsTable = $('[data-reviews-table]');
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

  var _fillReviewsTable = function(response) {
    response.forEach(function(row) {
      var newRow = $('<tr>');
      var newMovieTitle = $('<td>').text(row.movie.title);
      var newReviewerName = $('<td>').text(row.reviewer_name);
      var newReviewTitle = $('<td>').text(row.title);
      var newReviewText = $('<td>').text(row.text);
      var newReviewDate = $('<td>').text(row.review_date);
      newRow.append(newMovieTitle);
      newRow.append(newReviewerName);
      newRow.append(newReviewTitle);
      newRow.append(newReviewText);
      newRow.append(newReviewDate);
      newRow.appendTo(_$reviewsTable);
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
