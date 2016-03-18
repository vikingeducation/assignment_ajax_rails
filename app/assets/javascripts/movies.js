$( document ).ready( function() {
  movieModule.getMovieTable();
});

var movieModule = (function(){

  var $table, movieAjax, movieData;

  var registerEventListeners = function() {

  };

  var getMovieTable = function() {
    $table = $( "#movie-table" );
    movieAjax = $.ajax({
      url: "http://localhost:3000/movies.json",
      type: "GET",
      dataType: "json",
      contentType: "application/json",
      success: function() {
        populateMovieTable();
        console.log("movie table populated");
      },
      error: function() {
        console.log("movie table not populated");
      },
      complete: function() {
        console.log("complete");
      }
    });
    console.log(movieAjax);
  };

  var populateMovieTable = function() {
    movieData = JSON.parse( movieAjax.responseText );
    for ( var i = 0; i < movieData.length; i++ ) {
      var title = movieData[i].title;
      var date = movieData[i].created_at;

      var row = $("<tr data-id='" + movieData[i].id + "'></tr>");
      var titleCell = $("<td>" + title + "</td>");
      var dateCell = $("<td>" + date + "</td>");

      row.append(titleCell).append(dateCell);
      $table.append(row);
    }
  };

  return {
    getMovieTable: getMovieTable
  };
})();
