// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var movies = {

  populateMovieTable: function(response) {

    var $table = $("#movie-table");

    for(var i in response) {
      var $newRow = $("<tr>")
      var $title = $("<td>").text(response[i].title)
      var $releaseDate = $("<td>").text(response[i].release_date)
      $newRow.append($title)
      $newRow.append($releaseDate)
      $table.append($newRow)
    }
  },


  getAllMovies: function() {
    $.ajax({ url: "/movies.json", success: movies.populateMovieTable })
  },

  createNewMovie: function() {

  }
}

$(document).ready(function() {
  movies.getAllMovies();
})