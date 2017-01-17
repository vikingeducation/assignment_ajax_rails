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

      // reset the form, does not work
      $el.find('input[type="text"]').val('');
      $el.find('input[type="submit"]').prop('disabled', false);
    });
  };

  // take the response, populate the table with new movie
  var _addMovieRowToTable = function(data) {
    // dependency injection makes this fail
    MY_APP.movies.index.movieRow(data);
  };

  return exports;
})($);

$('body').ready(MY_APP.movies.create.attachMovieListener);
