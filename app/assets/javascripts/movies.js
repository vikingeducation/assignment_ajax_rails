var MOVIES = MOVIES || {};


MOVIES.Index = (function($){

  var init = function(){
    _getMovies();
  };

  var addMovie = function(movie){
    var $list = $("[data-model='movie'");
    date = new Date(movie.release_date);
    date = date.toLocaleDateString();
    $list.prepend("<tr><td>" + movie.title + "</td><td>" +
                  date + "</td></tr>");
  };

  var _getMovies = function(){
    return $.ajax({
      method: 'GET',
      // could use document.URL for the AJAX call
      url: $("meta[name='route']").attr("content"),
      dataType: "json"
    }).done(function(data){
      _parseMovies(data);
    });
  };

  var _parseMovies = function(movies){
    $.each(movies, function(i, movie){
      addMovie(movie);
    });
  };

  return {
    init: init,
    addMovie: addMovie
  };
})($);


MOVIES.Form = (function($){

  submit = function(){
    var formData = $('form').serializeArray();

    return $.ajax({
      method: 'POST',
      url: $("meta[name='route']").attr("content"),
      dataType: 'json',
      data: formData
    }).done(function(data){
      MOVIES.Index.addMovie(data);
    });
  };

  return {
    submit: submit
  };

})($);

$( document ).ready(function(){
  if ( $("[data-model='movie']").length ){
  
    $('form').on('submit', function(e){
      e.preventDefault();
      MOVIES.Form.submit();
    });

  }
});

$( document ).on('page:change', function(){
  if ( $("[data-model='movie']").length ){

    MOVIES.Index.init();
  
  }
});