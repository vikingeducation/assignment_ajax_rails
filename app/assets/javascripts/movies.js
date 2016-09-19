// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var movies = {

  populateMovieTable: function(response) {

    var $table = $("#movie-table");

    for(var i in response) {
      movies.createMovieRow(response[i], $table);
    }
  },

  createMovieRow: function(movie, table) {
    var $newRow = $("<tr>");
    var $title = $("<td>").text(movie.title);
    var $releaseDate = $("<td>").text(movie.release_date);
    $newRow.append($title);
    $newRow.append($releaseDate);
    table.prepend($newRow);
  },


  getAllMovies: function() {
    $.ajax({ url: "/movies.json", success: movies.populateMovieTable });
  },

  createNewMovie: function() {
    $("form[data-ajaxremote='true']").submit( function( event ){
      event.preventDefault();
      var $form = $( event.target );
      var formData = $form.serializeArray();
      $('input[type="text"]').val('');
      $.ajax({
        url: $form.attr("action"),
        method: "POST",
        data: formData,
        dataType: "json",
        success: movies.UpdateTableWithMovie
      });
      return false;
    });
  },

  UpdateTableWithMovie: function(response) {
    var $table = $("#movie-table");
    movies.createMovieRow(response, $table);
  }
};

$(document).ready(function() {
  if ($('body').data('controller') === 'movies') {
    movies.getAllMovies();
    movies.createNewMovie();
  }
});
