var ReviewModule = (function() {
  var getReviewTable = function() {
    return $('table[data-content="reviews"]');
  }

  var getReviewForm = function() {
    return $('form[data-form="review"]');
  }

  return {
    getReviewTable: getReviewTable,
    getReviewForm: getReviewForm
  }

})();

$(document).ready(function() {
  ReviewModule;
});