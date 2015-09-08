var JS = JS || {};

JS.MovieModule = (function(){

  function getMovies(){

    $.ajax({
      
      url: "movies.json",

      method: "GET",

      dataType: "json",

      success: function(json){
        buildMoviesList(json);
      },

      error: function(){
        alert("error");
      }


    });

  }

  function buildMoviesList(movies){
    console.log(movies);
    var $table = $('.movie-table');
    
    for(var i = 0; i < movies.length; i++ ){
      $table.append('<tr><td>'+movies[i].name+'</td><td>'+movies[i].release_date + '</td></tr>');
    }
  }

  return{
    getMovies: getMovies
  };


  
})();

