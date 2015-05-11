
//COPY PASTED 3 GUTS INTO FOUR; NEED TO DELETE main ON CLICK

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
          console.log( "Movies index loaded" );
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
          console.log( "Reviews index loaded" );
      }
    });

          //AJAX THREE: USER INPUT
    $("#movies-form").submit(function(e){
      var postData = $(this).serializeArray();
      console.log(postData);
      postData = ({name: postData[0].value, release_date: postData[1].value });
      postData = JSON.stringify(postData);
      $.ajax( {
        type: "POST",
        url: "/movies.json",
        data: postData,
        contentType: "application/json",
        dataType: "json",

        success: function( movie ) {
            console.log("success!");
            $("#my-movies").append("<tr><td>" + movie.name + "</td><td>" + movie.release_date + "</td></tr>");
        },

        error: function( xhr, status, errorThrown ) {
           $("#main-container").append("<h3>Error thrown, it is: " + errorThrown + " </h3>");
            console.log( "Error: " + errorThrown );
            console.log( "Status: " + status );
            console.dir( xhr );
        },

        complete: function( xhr, status ) {
            console.log( "The request is complete!" );
        }
      });
      e.preventDefault();
    });
  }
}

// $( document ).ready(function() {
//   myAjax.init();
// });

$(document).on('page:load', myAjax.init());