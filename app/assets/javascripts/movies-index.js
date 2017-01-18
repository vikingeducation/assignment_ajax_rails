/* globals $ */

var MY_APP = MY_APP || {};
MY_APP.movies = {};

MY_APP.movies.index = (function($) {
  var exports = {};

  exports.movieRow = function(movieObj) {
    var $title = $('<td>').text(movieObj.title);
    var $releaseDate = $('<td>').text(movieObj.release_date);
    $('<tr>')
      .attr('data-id', movieObj.id)
      .append($title)
      .append($releaseDate)
      .appendTo('#movie-list');
  };

  var _populateTable = function(data) {
    for (var i = 0; i < data.length; i++) {
      exports.movieRow(data[i]);
    }
  };

  exports.init = function() {
    $.ajax({
      url: '/movies.json',
      success: function(data) {
        _populateTable(data);
      }
    });
  };

  return exports;
})($);

$(document).ready(MY_APP.movies.index.init);
