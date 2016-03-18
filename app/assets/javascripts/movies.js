$( document ).ready( function() {
  movieModule.getMovieTable();
  movieModule.registerEventListeners();
});

var movieModule = (function(){

  var $table, movieAjax, movieData;

  var registerEventListeners = function() {
     _movieFormListener();
  };


  var _movieFormListener = function(){

    $("form[data-ajaxremote='true']").submit( function( event ){
    
      event.preventDefault();

      var $el = $( event.target );
      //var formData = { movie: {title: $el.serializeArray()[2].value}};
      var formData = {movie: $el.serializeArray()[2].value};
      $.ajax({
        url: $el.attr("action"),
        type: "POST",
        data: formData,
        dataType: "json",
        contentType: "application/json",
        success: function(movie){
          console.log( "MOVIE: " + movie);
          _addMovieRowToTable( movie );
        },

        error: function(){
          console.log( "ERROR");
        },

        complete: function(){
          console.log( "ERROR");
        }

      })
      
    });
  }

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
      var id = movieData[i].id;

      _addMovieRowToTable(title,id,date);
      // var row = $("<tr data-id='" + movieData[i].id + "'></tr>");
      // var titleCell = $("<td>" + title + "</td>");
      // var dateCell = $("<td>" + date + "</td>");

      // row.append(titleCell).append(dateCell);
      // $table.append(row);
    }
  };

  var _addMovieRowToTable = function(title,id,created_at) {
   
      var row = $("<tr data-id='" + id + "'></tr>");
      var titleCell = $("<td>" + title + "</td>");
      var dateCell = $("<td>" + created_at + "</td>");

      row.append(titleCell).append(dateCell);
      $table.append(row);
  };



  return {
    getMovieTable: getMovieTable,
    registerEventListeners: registerEventListeners
  };
})();
