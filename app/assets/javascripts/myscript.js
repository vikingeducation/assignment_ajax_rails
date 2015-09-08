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
    getReviews: getReviews
  };
})();
