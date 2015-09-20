var SMELLYPOTATOES = SMELLYPOTATOES || {};

SMELLYPOTATOES.MoviesModule = (function(){

  var $movieTable;
  var _index;


  function addListeners() {
    _ajaxFormListener();
  };


  function getIndex() {
    _index = $.ajax( {
      url: 'http://localhost:3000/movies.json',
      method: 'GET',
      dataType: 'json',
      contentType: 'application/json',
      success: _refreshIndex
    });
  };


  function _refreshIndex() {
    $movieTable = $("table[data-content='movies']")

    _index.responseJSON.forEach( function(movie, index) {
      _addMovieRow(movie);
    });
  };


  function _addMovieRow(movie) {
    var $row = $("<tr></tr>")
    var $title = $("<td></td>").text( movie.title );
    var $releaseDate = $("<td></td>").text( movie.release_date );

    $row.append($title).append($releaseDate)
    $movieTable.append($row);
  };


  function _ajaxFormListener() {
    $("form[data-ajaxremote='true']").submit( function( event ){
      event.preventDefault();
      var $form = $(event.target);
      var dataArray = $form.serializeArray();

      var formData = {}
      dataArray.forEach ( function(el) { formData[el.name] = el.value } )

      $.ajax({
        url: $form.attr('action'),
        method: 'POST',
        data: JSON.stringify(formData),
        dataType: 'json',
        contentType: 'application/json',

        success: function(data) {
          _addMovieRow(data)
        }
      });
    });
  };


  return {
    addListeners: addListeners,
    getIndex: getIndex
  };

})();




$(document).ready(function() {
  SMELLYPOTATOES.MoviesModule.addListeners();
  SMELLYPOTATOES.MoviesModule.getIndex();
});