var APP = APP || {};


APP.Movie = (function($) {
  var stub = {};

  var populateMovies = function(json) {
    for (var i = 0; i < json.length; i++) {
      $newRow = $('<tr></tr');
      $title = $("<td>" + json[i]["title"] + "</td>");
      $releaseDate = $("<td>" +json[i]["release_date"]+"</td>");
      $newRow.append($title).append($releaseDate);
      $('tbody').prepend($newRow);
    }
  };

  stub.getMovies = function() {
    $.ajax({
      url: "/movies",
      contentType: "application/json",
      type: "GET",
      dataType: "json",
      success: function(json) {
        populateMovies(json);
      },
      error: function(xhr, error) { console.log(error); }
    })
  };


  return stub;
})($);


$(document).ready(function() {
  if ($('#movies-index')) {
    APP.Movie.getMovies();
  }
});

