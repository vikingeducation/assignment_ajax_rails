var APP = APP || {};

APP.Movies = (function() {

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
    console.log(data);
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

  var onSumbit = function(event){

  }

  var newMovie = function(input){
    var data =  JSON.stringify(input)
    $.ajax({
      url: '/movies',
      method: 'POST',
      contentType: 'application/json',
      success: function(data){
        console.log("YAY MOVIE")
      },
      error: function(data){
        console.log("Hubris comes before a dizzying fall")
      },
      data: data
    })
  }

  return {
    getMovies: getMovies,
    newMovie: newMovie,
    onSumbit: onSumbit
  }

})($);

$(document).ready(function(){
  APP.Movies.getMovies();
});