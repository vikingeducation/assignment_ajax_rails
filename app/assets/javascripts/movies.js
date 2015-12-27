// We want this to be modular so we'll add the Movies-specific JS
//  to the MoviesModule.
var MoviesModule = (function(){

	// Get the movies table. Make it so the rest of the 
	//  code will only run on the table with the data-content
	//  attribute all-movies
	var getMoviesTable = function(){
		return $("[data-content='all-movies']");
	}

	// Gets passed {type: __, content: __ }
	//  can either be a success or error w/ error message
	var _buildMoviesTable = function(obj){
		if(obj.type == "success"){
			var buffer = '<tr><th>Title</th><th>Release Date</th></tr>';
			for(var i=0;i<obj.content.length;i++){
				buffer += '<tr>';
				buffer += '<td>'+ obj.content[i].title+'</td>';
				buffer += '<td>'+ $.format.date(obj.content[i].release_date, "MM/dd/yyyy")+'</td>';
				buffer += '</tr>';
			}
			var table = getMoviesTable();
			// Actually add the HTML to the table!
			table.html(buffer);

		} else if(obj.type == "error"){
			// This will alert the error thrown.
			alert(obj.content);
		}
	}

	var initMoviesTable = function(){
		$.ajax( {
			url: "/movies.json",
			type: "GET",
			dataType : "json",
			success: function( json ) {
				_buildMoviesTable({type: "success", content: json});
			},

			error: function( xhr, status, errorThrown ) {
				_buildMoviesTable({type: "error", content: errorThrown});
			}
		});
	}

	return {
		getMoviesTable: getMoviesTable, 
		initMoviesTable: initMoviesTable
	}

})();

// On Ready Calls
$( document ).ready(function(){
	MoviesModule.initMoviesTable();
});