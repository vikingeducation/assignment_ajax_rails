$( document ).ready( function() {
  if ( $("body").data("controller") === 'movies' ) {
    movieModule.getMovieTable();
    movieModule.registerEventListeners();
  }
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
      // var formData = { movie: {title: $el.serializeArray()[2].value}};
      var formData = { title: $el.serializeArray()[2].value };
      console.log(formData);
      $.ajax({
        url: $el.attr("action"),
        type: "POST",
        data: JSON.stringify(formData),
        dataType: "json",
        contentType: "application/json",
        success: function(movie){
          console.log("SUCCESS");
          _addMovieRowToTable( movie.title, movie.id, movie.created_at );
        },

        error: function(){
          console.log( "ERROR");
        },

        complete: function(){
          console.log( "COMPLETE");
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
      var reviews = movieData[i].reviews;

      _addMovieRowToTable(title,id,date,reviews);
   
    }
  };

  var _addMovieRowToTable = function(title,id,created_at,reviews) {
    var row = $("<tr data-id='" + id + "'></tr>");
    var titleCell = $("<td>" + title + "</td>");
    var dateCell = $("<td>" + created_at + "</td>");

    row.append(titleCell).append(dateCell);
    $table.prepend(row);
  };



  return {
    getMovieTable: getMovieTable,
    registerEventListeners: registerEventListeners
  };
})();
