/* globals $ */

var MY_APP = MY_APP || {};
MY_APP.movies = {};

MY_APP.movies.create = (function($) {
  var exports = {};

  exports.attachMovieListener = function() {
    _ajaxFormListener();
  };

  var _ajaxFormListener = function() {
    // is this data-attr ONLY a flag for jQuery?
    // tradeoff between selecting an ID vs data attr

    // find the form
    $("form[data-ajaxremote='true']").on('submit', function(e) {
      e.preventDefault();
      var $el = $(e.target);
      var formData = $el.serializeArray();


      // submit the form via ajax
      $.ajax({
        url: $el.attr('action'),
        method: 'POST',
        data: formData,
        dataType: 'json',
        error: function(xhr) {console.log(xhr); },
        success: function(data) {
          _addMovieRowToTable(data);
        }
      });
    });
  };

  // take the response, populate the table with new movie
  var _addMovieRowToTable = function(data) {
    console.log(data);
    // TODO
  };

  return exports;
})($);

$(document).ready(MY_APP.movies.create.attachMovieListener);
