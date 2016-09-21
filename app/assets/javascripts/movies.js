var movies = {

  updateList: function(movies){
    fooawesome = movies;
    movies.forEach(function(movie){
      var title = movie.title;
      var $row = $("<tr></tr>");

      var $cell = $("<td>" + title +"</td>");
      $row.append($cell);
      //append to #movie-rows
      $("#movie-body").append($row);
    })
  },

  setListener: function(){
    $("#movie-form").submit(function(event){
      event.preventDefault();

      var name = $("#movie-name").val();

      movies.createMovie(name);
    })


  },

  addMovie: function(movie){
    var title = movie.title;
    var $row = $("<tr></tr>");

    var $cell = $("<td>" + title +"</td>");
    $row.append($cell);

    $("#movie-body").append($row);
  },

  createMovie: function(title){
    $.ajax( {

      url: "/movies",

      type: "POST",

      // the type of data we expect back
      dataType: "json",

      contentType: 'application/json',

      data: JSON.stringify({ movie: {title: title} }),

      // Success callback to run if the request succeeds.
      // The response is passed to the function
      // as a variable, usually called `data` or `json`
      success: function( json ) {

          movies.addMovie(json);
      },

      // Error callback to run if the request fails
      // (e.g. server returns an error code like 301)
      // The raw request and any status codes are 
      // passed to the callback
      error: function( xhr, status, errorThrown ) {
          console.log( "Sorry, there was a problem!" );
          console.log( "Error: " + errorThrown );
          console.log( "Status: " + status );
          console.dir( xhr );
      },

      // Complete callback to run regardless of the outcome
      complete: function( xhr, status ) {
          console.log( "The request is complete!" );
      }
    });

  },


  getMovies: function(){
    $.ajax( {

      url: "movies.json",

      type: "GET",

      // the type of data we expect back
      dataType : "json",

      // Success callback to run if the request succeeds.
      // The response is passed to the function
      // as a variable, usually called `data` or `json`
      success: function( json ) {

          movies.updateList(json);
      },

      // Error callback to run if the request fails
      // (e.g. server returns an error code like 301)
      // The raw request and any status codes are 
      // passed to the callback
      error: function( xhr, status, errorThrown ) {
          console.log( "Sorry, there was a problem!" );
          console.log( "Error: " + errorThrown );
          console.log( "Status: " + status );
          console.dir( xhr );
      },

      // Complete callback to run regardless of the outcome
      complete: function( xhr, status ) {
          console.log( "The request is complete!" );
      }
    });
  },

  init: function(){
    movies.getMovies();
    movies.setListener();
  }



}//end movie object

$(document).ready(function(){
  
  movies.init();
})