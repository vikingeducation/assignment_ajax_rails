// "use strict";

var jaxCalls = {

  getMovies: function() {
    $("#movies").html("");

    $.get(
      "http://localhost:3000/movies.json",

      function(data) {
        alert("get");
        data.forEach(function(movie) {
          $("#movies").append("<tr><td>" + movie.name + "</td><td>" +
                              movie.release_date + "</td></tr>");
        });
      }
    );
  }
};

$(document).on('page:change', function() {
  jaxCalls.getMovies();
});
