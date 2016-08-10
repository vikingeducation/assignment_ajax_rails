

$(document).ready(function() {
	if ($("body").data("controller") == "movies") {
		movieModule.getListMovies();
		movieModule.createMovieListener();
	}
})

var movieModule = (function() {
	
	var getListMovies = function() {
		$.ajax({
			url: "movies.json",
			contentType: 'application/json',
			data: "json",
			success: function(data) {
				addMoviesToTable(data);
			}
		})
	}

	var addMoviesToTable = function(movies) {
		var $table = $('table');

		for (var i = 0; i < movies.length; i++) {
			var movie = movies[i];

			var $row = $('<tr>');
			var $title = $('<td>')
					  .html(movie.title);
			$row.append($title);

			var $releaseDate = $('<td>')
					  		   .html(movie.release_date);
			$row.append($releaseDate);

			$table.append($row);
		}
	}

	var createMovieListener = function() {
		$('form[data-ajaxremote="true"]').submit(function(event) {
			event.preventDefault();

			var $el = $(event.target);
			if ($el.find('#movie_title').val().length > 1) {
				_createNewMovie($el);
			} else {
				console.log('empty');
			}
		})
	}

	var _createNewMovie = function(el) {
		var formData = el.serializeArray();

		$.ajax({
			type: "POST",
			url: el.attr("action"),
			dataType: 'json',
			data: formData,
			success: function(data) {
				console.log('Creation !');
				addMoviesToTable([data]);
			}
		})
	}

	return {
		getListMovies: getListMovies,
		createMovieListener: createMovieListener,
		addMoviesToTable: addMoviesToTable
	}

})();