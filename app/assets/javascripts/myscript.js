var JS = JS || {};

JS.MovieModule = (function(){

  var $table;

  function init(){
    console.log("Hello");
    $table = $('.movie-table');
    console.log($table);
    _createMovieListener();
    getMovies($table);
  }

  function getMovies(table){

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

    for(var i = 0; i < movies.length; i++ ){
      $table.append('<tr><td>'+movies[i].name+'</td><td>'+movies[i].release_date + '</td></tr>');
    }
  }

  function _createMovieListener(){
    $('.submit-movie').click(function(e){
      e.preventDefault();
      createMovie($('#movie_name').val());
    });
  }

  function createMovie(movieName){
    console.log(movieName);

    $.ajax({
              url: 'movies.json',
              type: "POST",
              data: { movie: { name: movieName }},
              dataType: 'json',
              success: addMovie,
              error: function(xhr){
                console.log(xhr);
                alert("errrrorr");
              }

    });
  }

  function addMovie( movieObj ){
    console.log($(".movie-table tr:first"))
    $(".movie-table tr:first").after('<tr><td>'+ movieObj.name +'</td><td>' + movieObj.release_date +'</td></tr>');
  }

  return{
    init: init,
    getMovies: getMovies,
  };



})();

JS.ReviewModule = (function(){

  function getReviews(){

    $.ajax({

      url: "reviews.json",

      method: "GET",

      dataType: "json",

      success: function(json){
        buildReviewsList(json);
      },

      error: function(){
        alert("error");
      }


    });

  }

  function buildReviewsList(reviews){
    console.log(reviews);
    var $table = $('.review-table');

    for(var i = 0; i < reviews.length; i++ ){
      $table.append('<tr>\
        <td>'+reviews[i].movie_id +'</td>\
        <td>'+reviews[i].title +'</td>\
        <td>'+reviews[i].reviewer_name +'</td>\
        <td>'+reviews[i].text +'</td>\
        <td>'+reviews[i].date + '</td>\
        </tr>');
    }
  }

  return{
    getReviews: getReviews,
  };
})();
