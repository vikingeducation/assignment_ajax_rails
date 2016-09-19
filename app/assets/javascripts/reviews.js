var reviews = (function(){

  var appendReview = function(review) {
    $('.review-header').after(review);
    $(".notice").html("<%= escape_javascript(render :partial => 'shared/flash' , :locals => { :flash => flash }).html_safe %>");
  }

  var clearForm = function() {
    $name = $("#review_reviewer_name");
    $title = $('#review_title');
    $text = $('#review_review_text')
    $name.val("");
    $title.val("");
    $text.val("");
  }

  return {
    appendReview: appendReview,
    clearForm: clearForm
  }
})();