var MOVIES = MOVIES || {};

MOVIES.Movie = (function($){

  var listMovies = function(data){
    var $list = $('tbody');

    data.forEach(function(movie){
      var $row = $('<tr></tr>');
      $row.attr('data-id', movie.id);

      $row.append($('<td>' + movie.title + '</td>'));
      $row.append($('<td>' + movie.release_date + '</td>'))

      $list.append($row);
    } );
  }

  $.ajax({

    url: "http://localhost:3000/movies.json",
    method: "GET",
    success: function(data){
      listMovies(data);
    }

  })

} )($);



$(document).ready(function() {
  if ($('#movies-index').length) {
    MOVIES.Movie;
  }
})
