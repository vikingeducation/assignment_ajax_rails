$(document).on('page:change', function(){
  getMovies();
});

$(document).ready(function(){
  if($('#movies-index').length){
    MovieModule.getMovies();
    MovieModule.addListeners();
  }
});

var MovieModule = (function(){
  var getMovies = function(){
    $.ajax({
      url:"/movies",
      type: "GET",
      dataType: "json",
      success: addMovies
    });
  };

  var addMovies = function(data){
    data.forEach(function(movie){
      addMovie(movie);
    });
  };

  var addMovie = function(movie){
    var $newRow = $("<tr>");
    var $title = $("<td>");
    var $date = $("<td>");
    $title.append(movie.title);
    $date.append(movie.release_date);
    $newRow.append($title);
    $newRow.append($date);
    $('#movies').append($newRow);
  };

  var addListeners = function() {
    $("#submit").click(getNewMovie)
  };

  var getNewMovie = function(e){
    e.preventDefault();
    $.ajax({
      url: "/movies",
      type: "POST",
      data:{
        movie:{
          title: $("#title").val(),
          release_date: new Date()
        }
      },
      dataType: "json",
      success: addMovie
    });
   $("#title").val("");
  };

  return {
    getMovies: getMovies,
    addListeners: addListeners
  }
})();