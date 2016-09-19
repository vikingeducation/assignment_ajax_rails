var APP = APP || {};

APP.getMovies = function() {
  $.ajax({
    url: "/movies",
    contentType: "application/json"
    type: "GET",
    dataType: "json",
    success: function(json) {
      APP.populateMovies(json);
    },
    error: function(xhr, error) { console.log(error); }
  })
};

($(document).ready(function() {
  APP.getMovies();
})();

