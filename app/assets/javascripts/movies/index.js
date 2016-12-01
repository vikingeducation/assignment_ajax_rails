$(document).ready( function() {
  if( $("#movies-index").length ) {
    MyModule.init()
  }
});

var MyModule = (function() {
  var init = function(){
    $.ajax({
      url: "http://localhost:3000/movies",
      type: "GET",
      dataType : "json",

      success: function(json) {
        json.forEach(function(movie) {
          $("ul").append("<li>"+ movie.title +"</li>");
        });
      },

      error: function( xhr, status, errorThrown ) {
        console.log( "Error: " + errorThrown );
        console.log( "Status: " + status );
      },

      complete: function( xhr, status ) {
        console.log( "The request is complete!" );
      }
    });
  }
  return {
    init: init,
  }
})();

