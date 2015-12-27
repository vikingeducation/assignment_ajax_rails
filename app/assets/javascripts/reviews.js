// We want this to be modular so we'll add the Reviews-specific JS
//  to the ReviewsModule.
var ReviewsModule = (function(){

	// Get the reviews table. Make it so the rest of the 
	//  code will only run on the table with the data-content
	//  attribute all-reviews
	var getReviewsTable = function(){
		return $("[data-content='all-reviews']");
	}

	return {
		getReviewsTable: getReviewsTable, 
	}

})();