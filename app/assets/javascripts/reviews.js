var SP = SP || {}

SP.populateReviews = (function(){

  var useJSONObjectToPopulateTable = function(){
    $.ajax({
      method: 'GET',
      url: 'reviews.json',
      dataType: 'json',
      contentType: 'application/json',
      success: function(json){
        insertReviewIntoTable(json);
      }
    });
  };

  var insertReviewIntoTable = function(json){
    for (var i = 0; i < json.length; i++) {
      // console.log(json[i]);
      var name = json[i].reviewer_name;
      var title = json[i].title;
      var text = json[i].text;
      var movie_id = json[i].movie_id;
      var $review = $("<tr id='" + json[i].id + "'>").appendTo('#reviews-table');
      $review.append('<td>'+name+'</td>');
      $review.append('<td>'+title+'</td>');
      $review.append('<td>'+movie_id+'</td>');
      $review.append('<td>'+text+'</td>');
    }
  };

  return {
    run: useJSONObjectToPopulateTable
  };

})();

$(document).ready(function(){
  if ($("#reviews-table").length) {
    SP.populateReviews.run();
  };
});

// create reviews module
// add page specific JS