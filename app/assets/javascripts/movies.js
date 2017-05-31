// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http: //coffeescript.org/

var MovieModule = (function() {
  var init = function() {
    _loadMovieListings();
    _listenForFormSubmission();
  }

  var _listenForFormSubmission = function() {
    $('form[data-ajaxremote="true"]').submit(function(e) {
      e.preventDefault();
      var $el = $(e.target);
      var formData = $el.serializeArray();

      $.ajax({
        url: $el.attr('action'),
        method: 'POST',
        data: formData,
        dataType: 'json',
        success: function(data) {
          _addRowToMovieTable(data);
          _reenableSubmit($el);
        },
      })
    })
  }

  var _reenableSubmit = function(el) {
    el.find('input[type=submit]').attr('data-disable-with', null).prop('disabled', false);
  }

  var _getMovieTable = function() {
    return $("table[data-content='movies']");
  }

  var _loadMovieListings = function() {
    if (_getMovieTable().length) {
      $.ajax({
        url: window.location.origin + '/movies',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
          console.log('Success');
          $.each(data, function(i, movie) {
            _addRowToMovieTable(movie);
          })
        }
      })
    }
  }

  var _addRowToMovieTable = function(movie) {
    var $table = _getMovieTable();

    var date = new Date(movie.release_date);

    var $row = $('<tr>');
    var $title = $('<td>').text(movie.title);
    var $date = $('<td>').text(date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear());

    $row.append($title)
      .append($date);

    $table.find('tbody').prepend($row);
  }

  return {
    init: init
  }

})();



$(document).ready(function() {
  if ($('body').data('controller') == 'movies') {
    MovieModule.init();
  }
});