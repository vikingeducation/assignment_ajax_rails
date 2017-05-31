// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http: //coffeescript.org/

var MovieModule = (function() {
  var _reviewPage;

  var init = function() {
    _reviewPage = 1;
    _loadMovieListings();
    _listenForFormSubmission();
    _loadReviews();
    _setUpInfiniteScroll();
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

  var _convertToHumanDate = function(date) {
    return date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
  }

  var _reenableSubmit = function(el) {
    el.find('input[type=submit]').attr('data-disable-with', null).prop('disabled', false);
  }

  var _getMovieTable = function() {
    return $("table[data-content='movies']");
  }

  var _getReviewTable = function() {
    return $("table[data-content='reviews']");
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

  var _setUpInfiniteScroll = function() {
    // this triggers whenever you scroll
    $(window).scroll(function() {
      // if you're at the bottom of the page
      if ($(window).scrollTop() == $(document).height() - $(window).height()) {
        _loadReviews();
      }
    });
  }


  var _loadReviews = function() {
    if (_getReviewTable().length) {
      $.ajax({
        url: window.location.origin + '/reviews',
        type: 'GET',
        dataType: 'json',
        data: {
          page: _reviewPage
        },
        success: function(data) {
          console.log(data);
          _reviewPage++;
          $.each(data, function(i, review) {
            _addRowToReviewTable(review);
          });

        },
        error: function(a, b, c) {
          console.log(a, b, c);
        }
      });
    }
  }

  var _addRowToReviewTable = function(review) {
    // <a data-confirm="Are you sure you want to delete this?" data-remote="true" rel="nofollow" data-method="delete" href="/reviews/117">Delete</a>
    var $table = _getReviewTable();
    var date = _convertToHumanDate(new Date(review.review_date));
    var $row = $('<tr>').attr('data-review-id', review.id);
    var $title = $('<td>').text(review.title);
    var $movie = $('<td>').text(review.movie.title);
    var $reviewer = $('<td>').text(review.reviewer_name);
    var $text = $('<td>').text(review.review_text);
    var $link = $('<a>').attr({
      href: '/reviews/' + review.id,
      'data-method': 'delete',
      'data-remote': 'true',
      'data-confirm': 'Are you sure you want to delete this?'
    }).text('Delete');
    var $delete = $('<td>').append($link);

    $row.append($movie)
      .append($reviewer)
      .append($title)
      .append($text)
      .append(date)
      .append($delete);

    $table.find('tbody').append($row);
  }

  var _addRowToMovieTable = function(movie) {
    var $table = _getMovieTable();

    var date = _convertToHumanDate(new Date(movie.release_date));

    var $row = $('<tr>');
    var $title = $('<td>').text(movie.title);
    var $date = $('<td>').text(date);

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