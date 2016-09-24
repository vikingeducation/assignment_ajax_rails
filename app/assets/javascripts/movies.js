// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var MY_APP = MY_APP || {};

MY_APP.movieCtr = (function () {
	var stub = {};

	stub.init = function () {
		_populateMovieIndex();
		_ajaxFormListener();
	};

	var _ajaxFormListener = function () {
		$("form[data-ajaxremote='true']").submit(function (event) {
			event.preventDefault();
			var $el = $(event.target);
			var formData = $el.serializeArray();
			$.ajax({
				url: "/movies.json",
				method: "post",
				data: formData,
				// contentType: "application/json",
				dataType: 'json',
				success: function (json) {
					_addMovieToList(json);
				},
			});
			return false;
		});
	};

	var _addMovieToList = function (json) {
		var $title = $("<td></td>").html(json.title);
		var $releaseDate = $("<td></td>").html(json.release_time);
		var $oneMovie = $("<tr></tr>").append($title).append($releaseDate);
		$(".movieList").prepend($oneMovie);
	};

	var _populateMovieIndex = function () {
		$.ajax({
			url: "/movies.json",
			method: "get",
			success: function (json) {
				_fillMoveTable(json);
			},
		});
	};

	var _fillMoveTable = function (json) {
		for (var i = 0; i < json.length; i++) {
			var $title = $("<td></td>").html(json[i].title);
			var $releaseDate = $("<td></td>").html(json[i].release_time);
			var $oneMovie = $("<tr></tr>").append($title).append($releaseDate);
			$(".movieList").append($oneMovie);
		};
	};

	return stub;
})();

document.addEventListener("turbolinks:load", function () {
	console.log("hello world");
	if ($("body").data("controller") === 'movies') {
		MY_APP.movieCtr.init();
	};
})
