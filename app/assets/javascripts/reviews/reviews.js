var APP = APP || {};

APP.Review = (function($) {
  var stub = {};

  var page = 2;

  stub.init = function(){
    addScrollListener()
  };

  var populateReviews = function(json){
    for (var i = 0; i < json.length; i++) {
      $newRow = $('<tr></tr');
      $movieReviewed = $("<td>" + json[i]["movie_id"] + "</td>");
      $reviewerName = $("<td>" + json[i]["reviewer_name"] + "</td>");
      $title = $("<td>" + json[i]["title"] + "</td>");
      $reviewText = $("<td>" + json[i]["review_text"] + "</td>");
      $reviewDate = $("<td>" +json[i]["review_date"]+"</td>");
      $newRow.append($movieReviewed).append($reviewerName)
             .append($title).append($reviewText).append($reviewDate);
      // var movieID = json[i]["movie_id"]
      // var newMovieText = $('select').find("option[value=" + movieID + "]").text()
      // $("" + movieID +)
      $('tbody').append($newRow);
      console.log("Do we get to the end?");
    }
  };

  var addScrollListener = function(){
    $(window).scroll(function(){
        // if you're at the bottom of the page
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){
          $.get({
            url: "/reviews",
            data: {
              page: page
            },
            dateType: "json",
            contentType: "application/json",
            success: function(response) {
              page += 1;
              populateReviews(response);
            }
          })
        }
    });
  }


  return stub;
})($);






$(document).ready(function() {
  if ($('#reviews-index').length) {
    APP.Review.init();
  }
});
