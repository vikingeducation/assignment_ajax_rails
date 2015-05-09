
//COPY PASTED 3 GUTS INTO FOUR; NEED TO DELETE PUPPY ON CLICK

var myAjax = {
  init: function(){
    $.ajax( {
      url: "http://localhost:3000/movies.json",
      type: "GET",
      dataType : "json",

      success: function( json ) {
        json.forEach(function(movie){
          $("#my-movies").append("<tr><td>" + movie.name + "</td><td>" + movie.release_date + "</td></tr>");
        });
      },

      error: function( xhr, status, errorThrown ) {
        $("#error").append("<h3>Error thrown, it is: " + errorThrown + " </h3>");
          console.log( "Error: " + errorThrown );
          console.log( "Status: " + status );
          console.dir( xhr );
      },

      complete: function( xhr, status ) {
          console.log( "The request is complete!" );
      }
    });

    $.ajax( {
      url: "http://localhost:3000/reviews.json",
      type: "GET",
      dataType : "json",

      success: function( json ) {
        json.forEach(function(review){
          $("#my-reviews").append("<tr><td>" + review.reviewer_name + "</td><td>" + review.title + "</td><td>" + review.review_text + "</td></tr>");
        });
      },

      error: function( xhr, status, errorThrown ) {
        $("#error").append("<h3>Error thrown, it is: " + errorThrown + " </h3>");
          console.log( "Error: " + errorThrown );
          console.log( "Status: " + status );
          console.dir( xhr );
      },

      complete: function( xhr, status ) {
          console.log( "The request is complete!" );
      }
    });
  }
}

$( document ).ready(function() {
  myAjax.init();
});