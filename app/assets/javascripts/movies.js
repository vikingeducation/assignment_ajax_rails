var SP = SP || {};

SP.populateMovies = (function () {

  var insertMovieIntoTable = function (json){
    // json.reverse();
    for (var i = 0; i < json.length; i++) {
      // console.log(json[i]);
      var name = json[i].name;
      var date = json[i]['release_date'];
      var $movie = $("<tr id='" + json[i].id + "'>").prependTo('#movies');
      $('<td>'+name+'</td><td>'+date+'</td>').prependTo($movie);
    }
  };

  var getMovies = function () {
    $.ajax({
      method: "GET",
      url: "movies.json",
      dataType: "json",
      contentType: "application/json",
      success: function (json) {
        insertMovieIntoTable(json);
      }
    });
  };

  return {
    run: getMovies,
  };

})();

$(document).ready(function(){
  if ($("#movies").length) {
    SP.populateMovies.run();
  }
});
