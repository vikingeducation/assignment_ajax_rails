var APP = APP || {};

APP.Movies = (function() {

  var init = function() {
    getMovies();
    _addSubmitListener();   
  };

  var _addSubmitListener = function() {
    $('#new-movie').on("submit", function(e) {
    e.preventDefault();
      _submitMovie(e);
    });
  };

  var _displayMovies = function(data) {

    var $table = $('table').data('id', 'movie-table');

    data.forEach(function(element) {

      var $title = $('<td>')
        .text(element.title);

      var $release_date = $('<td>')
        .text(element.release_date);

      var $row = $('<tr>')
        .append($title)
        .append($release_date);

      $table.append($row);

    });

  };

  var _errorDisplayingMovies = function(data) {
    var $table = $('table').data('id', 'movie-table');
    $table.text(data.statusText);
  };

  var getMovies = function() {

    $.ajax({
        url: '/movies',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
          _displayMovies(data);
        },
        error: function(data) {
          _errorDisplayingMovies(data);
        }
      });

  };

  var _submitMovie = function(e) {

    var title = $('#movie_title').val();
    $('#movie_title').val("")
    var data = {};
    data.title = title;
    newMovie(data);
  };

  var newMovie = function(input){
    var data = JSON.stringify(input);
 
    $.ajax({
      url: '/movies',
      method: 'POST',
      dataType: 'json',
      contentType: 'application/json',
      success: function(data){
        console.log("YAY MOVIE");
        _displayMovies([data]);
      },
      error: function(data){
        console.log("Hubris comes before a dizzying fall");
      },
      data: data
    });
  }
 
  return {
    init: init,
    getMovies: getMovies,
  }

})($);

$(document).ready(function(){
  APP.Movies.init();
});