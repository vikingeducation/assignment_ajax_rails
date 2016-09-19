var MovieModule = (function() {

  var getMovies = function() {
    return $(".movies")
  };

  var formListener = function() {
    $("form[data-ajaxremote='true']").submit(function(event) {
      event.preventDefault();

      var $el = $(event.target);
      var formData = $el.serializeArray();

      $.ajax({
        url: $el.attr("action"),
        method: "POST",
        data: formData,
        dataType: "json",
        success: function(data) {
          addMovieToTable(data);
          $('.movie-submit-button').removeAttr("disabled");
        }
      })
    })
  };

  var addMovieToTable = function(movie) {
    var $table = getMovies();
    var $row = $("<tr></tr>")
    var $movieTitle = $("<td></td").text(movie.title);
    var $releaseDate = $("<td></td").text(movie.release_date);

    $row.append($movieTitle);
    $row.append($releaseDate)
    $table.append($row);
  };

  return {
    getMovies: getMovies,
    formListener: formListener
  };

})();