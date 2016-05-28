'use strict;'

var APP = APP || {};

APP.MovieModule = (function(){

  var $tbody = $('tbody[data-content="movies"]');

  function init(){
    _setFormListener();
    _getMovies();
  }

  function _setFormListener(){
    $('form[data-ajaxremote=true]').submit(_postMovie);
  }

  function _postMovie(){
    event.preventDefault();

    var $form = $(event.target);
    var formData = $form.serializeArray();

    // Submit new movie form
    $.ajax({
      url: $form.attr('action'),
      method: 'POST',
      data: formData,
      dataType: 'json',
      success: function(json){
        console.log('Added new movie!');
        _addNewMovieRow(json);
      }
    });
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
      _addNewMovieRow(movie, $tbody);
    });
  }

  function _addNewMovieRow(movie, $tbody){
    if (!$tbody) {
      var $tbody = $('tbody[data-content="movies"]');
    }

    var $row = $('<tr></tr>')
        .html('<td>' + movie.title + '</td><td>' + movie.release_date + '</td>');

    $tbody.prepend($row);
  }

  return {
    init: init
  }
})();