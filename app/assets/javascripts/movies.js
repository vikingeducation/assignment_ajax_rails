$(document).on('page:change', function(){
  getMovies();
})

var getMovies = function(){
  $.ajax({
    url:"movies",
    type: "GET",
    dataType: "json",
    success: addMovies
  })
}

var addMovies = function(data){
  data.forEach(function(movie){
    var $newRow = $("<tr>");
    var $title = $("<td>");
    var $date = $("<td>");
    $title.append(movie.title);
    $date.append(movie.release_date);
    $newRow.append($title);
    $newRow.append($date);
    $('#movies').append($newRow);
  })
}