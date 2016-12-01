$(document).ready( function() {
  if( $("#movies-index").length ) {
    MovieModule.init()
    MovieModule.createMovieListener();
  }
});

var MovieModule = (function() {
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

  var createMovieListener = function() {
    $("#movie-form").submit(function(e){
      e.preventDefault();
      var postData = $(this).serializeArray();
      postData = ({title: postData[2].value, release_date: (new Date) });
      postData = JSON.stringify(postData);
      $.ajax( {
        url: "http://localhost:3000/movies",
        data: postData,
        type: "POST",
        contentType: "application/json",
        dataType: "json",

        success: function( movie) {
          $("ul").append("<li>"+ movie.title +"</li>");
          $("#movie-form").bind('submit')
        },

        error: function( xhr, status, errorThrown ) {
          console.log( "Error: " + xhr.responseText );
          console.log( "Status: " + status );
          console.dir( xhr );
        },

        complete: function( xhr, status ) {
          $("#movie-form-button").removeAttr('disabled');
          console.log( "The request is complete!" );
        }
      })
    });
  }

  return {
    init: init,
    createMovieListener: createMovieListener,
  }
})();

