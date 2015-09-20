var SMELLYPOTATOES = SMELLYPOTATOES || {};

SMELLYPOTATOES.MoviesModule = (function(){

  var $movieTable;
  var _index;

  function getIndex() {
    _index = $.ajax( {
      url: 'http://localhost:3000/movies.json',
      method: 'GET',
      dataType: 'json',
      contentType: 'application/json',
      success: _refreshIndex
    });
  }

  function _refreshIndex() {
    $movieTable = $("table[data-content='movies']")

    _index.responseJSON.forEach( function(movie, index) {
      _addMovieRow(movie);
    });
  }

  function _addMovieRow(movie) {
    var $row = $("<tr></tr>")
    var $title = $("<td></td>").text( movie.title );
    var $releaseDate = $("<td></td>").text( movie.release_date );

    $row.append($title).append($releaseDate)
    $movieTable.append($row);
  }


  return {
    getIndex: getIndex
  }

})();


$(document).ready(function() {
  SMELLYPOTATOES.MoviesModule.getIndex();
});