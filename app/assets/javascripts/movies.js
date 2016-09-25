// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

var movies = {

  populateMovieTable: function(response) {
    console.log(response);
    var $movieTable = $("#movie-table");
    var $reviewTable = $('#review-table');

    var responseMovies = response[0];
    var reviews = response[1];
    for(var i in responseMovies) {
      movies.createMovieRow(responseMovies[i], $movieTable);
    }

    for(var j in reviews) {
      movies.createReviewRow(reviews[j], $reviewTable, responseMovies);
    }
  },

  createReviewRow: function(review, table, responseMovies) {
    // console.log(review);
    var $newRow = $("<tr>");
    var $title = $("<td>").text(movies.findMovieTitle(review, responseMovies));
    var $name = $("<td>").text(review.reviewer_name);
    var $reviewTitle = $("<td>").text(review.title);
    var $text = $("<td>").text(review.review_text);
    var $date = $("<td>").text(review.review_date);
    $newRow.append($title, $name, $reviewTitle, $text, $date);
    table.prepend($newRow);
  },

  findMovieTitle: function(review, rMovies) {
    for(var i in rMovies){
      if(rMovies[i].id === review.movie_id){
        return rMovies[i].title;
      }
    }
    return false;
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
