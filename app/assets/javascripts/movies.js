var JS = {};

JS.movies = (function(){
    var stub = {};
    stub.init = function() {
      $.ajax({
          url: "/movies",
          method: 'GET',
          contentType: 'application/json',
          dataType: 'json',
          success: function(response){
            populateTable(response);
          }
        }
      );
    };

    var populateTable = function(response){
      $.each(response, function(index, el){
        var $movieListing = $('<li>').text(el.title);
        $('ul').append($movieListing);
      });
    };

    stub.addMovie = function(movieData){
      $.ajax({
        url: "/movies",
        method: 'POST',
        data: JSON.stringify({ movie: { title: movieData} }),
        contentType: 'application/json',
        dataType: 'json',
        success: function(response){
          populateTable([response]);
        },
        error: function(response){
          console.log(response);
        }
      });
    };

    stub.addMovieListener = function(){
      $('input[type="submit"]').on('click', function(e){
        e.preventDefault();
        console.log("Hello andur");
        var movieTitle = $('input[type="text"]').val();
        stub.addMovie(movieTitle);
      });
    };

    return stub;
})();

$( document ).ready( function(){

  // Attach our listeners after the DOM loads
  JS.movies.init();
  JS.movies.addMovieListener();
});
