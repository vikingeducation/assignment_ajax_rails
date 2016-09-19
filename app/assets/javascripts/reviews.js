var JS = JS || {};


JS.reviews = (function($) {
  stub = {}

  stub.findTable = function() {
    return $("[data-id='table-labels']")
  }

  stub.addReviewListener = function() {
    $('tr').on("click", "a", function(e) {
      e.preventDefault();
      $(this).parent().parent().remove();
    });
  }

  return stub;

})($)
