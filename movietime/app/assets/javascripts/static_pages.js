
//COPY PASTED 3 GUTS INTO FOUR; NEED TO DELETE PUPPY ON CLICK

var myAjax = {
  init: function(){
    $.ajax( {
      url: "http://localhost:3000/movies.json",
      type: "GET",
      dataType : "json",

      success: function( json ) {
        alert("successin");
        json.forEach(function(movie){
          $("#my-movies").append("<tr><td>" + movie.name + "</td><td>" + movie.release_date + "</td></tr>");
        });
      },

      error: function( xhr, status, errorThrown ) {
        $("#puppy-container").append("<h3>Error thrown, it is: " + errorThrown + " </h3>");
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
  alert("werkin");
  myAjax.init();
});