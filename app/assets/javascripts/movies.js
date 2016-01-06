// Movies

var APP = APP || {};
APP.MoviesController = APP.MoviesController || {};

APP.MoviesController = (function($) {

  var MoviesController = function(){};

  MoviesController.index = function() {
    $.ajax({
      url: '/movies.json',
      success: function(data) {
        $.each(data, function(index, movie) {
          var $movie = $('<tr>' +
            '<td>' + movie.title + '</td>' +
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

  if ($('#movies-index').length) {
    APP.MoviesController.index();
  }

});

