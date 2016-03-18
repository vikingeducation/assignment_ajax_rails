var MOVIES = MOVIES || {};

MOVIES.Movie = (function($){

  var injectMovie = function(movie, $list){
    var $row = $('<tr></tr>');
    $row.attr('data-id', movie.id);
    $row.append($('<td>' + movie.title + '</td>'));
    $row.append($('<td>' + movie.release_date + '</td>'));
    $list.append($row);
  };

  var listMovies = function(data){
    var $list = $('tbody');
    data.forEach(function(movie){
      injectMovie(movie, $list);
    } );
  };

  var setCreateListener = function() {
    $('form').on('submit', function(event) {
      var $form = $(event.target);
      event.preventDefault();
      var data = $form.serializeArray();

      $.ajax({
        url: "http://localhost:3000/movies",
        method: "POST",
        data: {title: data[2].value},
        success: function(data){
          var $list = $('tbody');
          injectMovie(data, $list);
        }
      });

    });
  };

  var index = function() {
    $.ajax({
      url: "http://localhost:3000/movies.json",
      method: "GET",
      success: function(data){
        listMovies(data);
      }

    });
  };
  
  return {
    index: index,
    setCreateListener: setCreateListener
  }
} )($);



$(document).ready(function() {
  if ($('#movies-index').length) {
    MOVIES.Movie.index();
    MOVIES.Movie.setCreateListener();
  }
})
