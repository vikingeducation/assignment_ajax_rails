var MOVIES = MOVIES || {};

MOVIES.Review = (function($) {
  var injectReview = function(review, $list) {
    var $row = $('<tr></tr>');
    $row.attr('data-id', review.id);
    $row.append($('<td>' + review.movie.title + '</td>'));
    $row.append($('<td>' + review.reviewer_name + '</td>'));
    $row.append($('<td>' + review.title + '</td>'));
    $row.append($('<td>' + review.review_text + '</td>'));
    $row.append($('<td>' + review.review_date + '</td>'));
    $list.append($row);
  }


})