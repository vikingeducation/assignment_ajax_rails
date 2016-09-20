var reviews = (function(){

  var appendReview = function(review) {
    $('.review-header').after(review);
  }

  var clearForm = function() {
    $name = $("#review_reviewer_name");
    $title = $('#review_title');
    $text = $('#review_review_text')
    $name.val("");
    $title.val("");
    $text.val("");
  }

  var deleteReview = function(id) {
    $("[data-id ="+ id + "]").remove();
  }

  return {
    appendReview: appendReview,
    clearForm: clearForm,
    deleteReview: deleteReview
  }
})();