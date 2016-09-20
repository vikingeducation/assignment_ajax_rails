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

  var getMovies = function() {
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

  var setSubmitListener = function() {
    var newDate = new Date();

    $("#movie-submit").on("click", function(event){
      event.preventDefault();
      var $title = $('#new-form-text').val();
      var data = {
        title: $title,
        release_date: newDate
      }

      $.post({
        url: "/movies",
        data: JSON.stringify(data),
        dataType: "json",
        contentType: "application/json",
        success: function(){
          populateMovies([data])
        }
      })
    });
  };

  stub.init = function() {
    getMovies();
    setSubmitListener();
  }


  return stub;
})($);


$(document).ready(function() {
  if ($('#movies-index').length) {
    APP.Movie.init();
  }
});

