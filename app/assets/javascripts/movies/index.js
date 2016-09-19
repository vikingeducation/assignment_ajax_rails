var APP = APP || {};

APP.getMovies = function() {
  $.ajax({
    url: "/movies",
    contentType: "application/json",
    type: "GET",
    dataType: "json",
    success: function(json) {
      APP.populateMovies(json);
    },
    error: function(xhr, error) { console.log(error); }
  })
};

APP.populateMovies = function(json) {
  for (var i = 0; i < json.length; i++) {
    $newRow = $('<tr></tr');
    $title = $("<td>" + json[i]["title"] + "</td>");
    $releaseDate = $("<td>" +json[i]["release_date"]+"</td>");
    $newRow.append($title).append($releaseDate);
    $('tbody').append($newRow);
  }
};

$(document).ready(function() {
  APP.getMovies();
});

