// Movies

var APP = APP || {};
APP.MoviesController = APP.MoviesController || {};


APP.MoviesController = (function($) {

  var MoviesController = function(){};


  // ----------------------------------------
  // Movies#index
  // ----------------------------------------


  MoviesController.index = function() {
    var $movies = $('#movies');
    var $table = $('<table id="movies" class="table">' +
      '<thead>' +
        '<tr>' +
          '<th>Title</th>' +
          '<th>Release Date</th>' +
        '</tr>' +
      '</thead>' +
      '<tbody></tbody>' +
    '</table>')
    $table.insertAfter($movies);
    $movies.remove();

    $.ajax({
      url: '/movies.json',
      success: function(data) {
        $.each(data, function(index, movie) {
          var $movie = $('<tr>' +
            '<td><a href="/movies/' + movie.id + '">' + movie.title + '</a></td>' +
            '<td>' + movie.date + '</td>' +
          '</tr>')
          $('#movies').append($movie);
        });
      },
      error: function(xhr, status, error) {
        console.log(error);
      }
    });
  };

  return MoviesController;

})($);



$(document).ready(function(e) {

  if ($('#movies-index')) {
    APP.MoviesController.index();
  }

});

