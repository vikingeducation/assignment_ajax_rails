var APP = APP || {};

APP.MoviesController = (function(){

  var init = function() {
    _index();
    _setFormListener();
  }

  var _setFormListener = function() {
    $('form').submit( function(e) {
      event.preventDefault();
      var $e = $(event.target);
      var formData = $e.serializeArray();
      $.ajax({
        url: '/movies.json',
        method: 'POST',
        dataType: 'json',
        data: formData,
        success: function(data) { _addMovieToTable(data) },
        error: function(error) { console.log(error.responseText) }
      });
    });
  }

  var _addMovieToTable = function(data) {
    $body = $('tbody');
    $row = $('<tr></tr>');
    $title = $('<td></td>').html(data.title);
    $row.append($title);
    $date = $('<td></td>').html(data.release_date);
    $row.append($date);
    $body.prepend($row);
  }

  var _index = function() {
    $.ajax({
      url: '/movies.json',
      method: 'GET',
      success: function(data) { _populateMovieTable(data) }, 
    });
  }

  var _populateMovieTable = function(data) {
    $body = $('tbody');
    data.forEach(function(movie) {
      $row = $('<tr></tr>');
      $title = $('<td></td>').html(movie.title);
      $row.append($title);
      $date = $('<td></td>').html(movie.release_date);
      $row.append($date);
      $body.append($row);
    })
  }

  return {
    init: init
  }

})();


$( document ).ready( function() {
  if ( $('body').data("controller") == "movies" ) {
    APP.MoviesController.init();
  }
});