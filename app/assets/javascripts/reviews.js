var ReviewModule = (function() {


  var _addAjaxListeners = function() {
    var row
  }
  var getReviewTable = function() {
    return $('table[data-content="reviews"]');
  }

  var getReviewForm = function() {
    return $('form[data-form="review"]');
  }

  var getReviewRow = function(id) {
    return $('tr[data-review-id=' + id + ']')[0];
  }

  return {
    getReviewTable: getReviewTable,
    getReviewForm: getReviewForm,
    getReviewRow: getReviewRow
  }

})();

$(document).ready(function() {
  ReviewModule;
});