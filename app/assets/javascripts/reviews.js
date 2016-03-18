Reviews = (function(){
  

  var showReviewList = function(){
    var url = "http://localhost:3000/reviews.json";
    
    var callback = function(data) {
      var $reviewList = $('#review-list');

      data.forEach( function(elt){
        var $ReviewTableRow = $('<tr></tr>')
        $reviewList.prepend($reviewTableRow);
        var $reviewTDElt = $('<td>' + elt.title + '</td><td>' + elt.release_date + '</td>');
        $reviewTableRow.prepend($reviewTDElt);
      })
    }
  };

  var showNoReviews = function() {
    var $reviewList = $('#review-list');
    var $noReviews = $('<p>No reviews to show</p>');
    $reviewList.append($noReviews);
  };

  return{
    showReviewList: showReviewList,
    showNoReviews: showNoReviews
  };

  $(document).ready(function(){
   if($('#reviews-index').length){
      Reviews.showReviewList();
    } 
    else {
      Reviews.showNoReviews();
    });
 });