// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .

$(document).ready(function() {
  $.get("/movies", '', function(event) { populate(event); }, "json")
  MovieModule.formListener();
});

var populate = function(event) {
  var $table = $('.movies');
  for (var i = 0; i < event.length; i++) {
    var $listing = $('<tr>');
    var $movie = $('<td>').text(event[i].title);
    var $release = $('<td>').text(event[i].release_date);
    $listing.append($movie, $release);
    $table.append($listing);
  }
};

// var submitNewMovie = function() {
//   $(".movie-submit-button").on("click", function(event) {
//     Remove below when ready to test
//     event.preventDefault();
//     console.log($("movie[title]").text());
//   })
// }