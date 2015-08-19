// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//=require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// "use strict";

var jaxCalls = {

  getMovies: function() {
    $("#movies").html("");

    $.get(
      "http://localhost:3000/movies.json",

      function(data) {
        data.forEach(function(movie) {
          $("#movies").append("<tr><td>" + movie.name + "</td><td>" +
                              movie.release_date + "</td></tr>");
        });
      }
    );
  },

  getReviews: function() {
    $("#reviews").html("");

    $.get(
      "http://localhost:3000/reviews.json",

      function(data) {
        data.forEach(function(review) {
          $("#reviews").append("<tr><td>" + review.reviewer_name + "</td><td>" +
                              review.title + "</td><td>" +
                              review.review_text + "</td><td>" +
                              review.review_date + "</td><td>" +
                              review.movie_id + "</td></tr>"
                            );
        });
      }
    );
  },

  postMovie: function(submitEvent) {
    submitEvent.preventDefault();

    var $form = $("#new-movie"),
                name = $form.find("input[name='name']").val();

    var unformatted = new Date($form.find("input[name='datepick']").val());
    var release_date = unformatted.toISOString();

    var posting = $.post(
                    "http://localhost:3000/movies.json",
                    { name: name, release_date: release_date }
                  );

    posting.done(function(data){
      $("#movies > tbody > tr:first").before("<tr><td>" + data.name +
                                             "</td><td>" + data.release_date +
                                             "</td></tr>");
    });
  }

};

$(document).on('page:change', function() {
  jaxCalls.getMovies();
  jaxCalls.getReviews();

  $("#new-movie").submit(function(submit){
    jaxCalls.postMovie(submit);
  });
});
