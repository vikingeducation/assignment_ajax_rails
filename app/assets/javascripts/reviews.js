var SP = SP || {};

SP.populateReviews = (function(){

  var page_count = 1;

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


  var infiniteScroll = function(){
    $(window).scroll(function(){
        // if you're at the bottom of the page
        // console.log("document height" + $(document).height())
        // console.log("window height" + $(window).height())
        if  ($(window).scrollTop() == $(document).height() - $(window).height()){
          page_count++;
          $.ajax({
            method: 'GET',
            url: 'reviews?page='+page_count,
            dataType: 'script',
            // success: function(script) {
            //   console.log(script)
            // }
          });
        }
    });
  };


  return {
    run: useJSONObjectToPopulateTable,
    infiniteScroll: infiniteScroll
  };

})();

$(document).ready(function(){
  if ($("#reviews-table").length) {
    SP.populateReviews.infiniteScroll();
    // SP.populateReviews.run();
  }
});

// create reviews module
// add page specific JS