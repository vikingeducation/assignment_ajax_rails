/* globals $ */

var MY_APP = MY_APP || {};
MY_APP.movies = {};

MY_APP.movies.create = (function($) {
  var exports = {};

  var attachMovieListener = function() {
    _ajaxFormListener();
  };

  var _ajaxFormListener = function() {
    // is this data-attr ONLY a flag for jQuery?
    // tradeoff between selecting an ID vs data attr

    // find the form
    $("form[data-ajaxremote='true']").submit(function(e) {
      e.preventDefault();
      var $el = $(e.target);
      var formData = $el.serializeArray();

      // submit the form via ajax
      $.ajax({
        url: $el.attr('action'),
        method: 'POST',
        data: formData,
        dataType: 'json',
        success: function(data) {
          console.log('success');
          _addMovieRowToTable(data);
        }
      });
    });
  };

  // take the response, populate the table with new movie
  var _addMovieRowToTable = function(data) {
    // TODO
  };

  return exports;
})();
