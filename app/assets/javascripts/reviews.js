// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var MY_APP = MY_APP || {};

MY_APP.reviewCtr = (function () {
	var stub = {};

	stub.init = function () {};

	return stub;
})();

document.addEventListener("turbolinks:load", function () {
	console.log("hello world");
	if ($("body").data("controller") === 'reviews') {
		MY_APP.reviewCtr.init();
	};
})
