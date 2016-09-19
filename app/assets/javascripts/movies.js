var JS = JS || {};

JS.movies = (function() {
  var stub = {};
  stub.init = function() {
    ajaxMovies("/movies");
    ajaxReviews();
    addPageListener();
    scrollLoad();
  };

  var ajaxMovies = function(url) {
    $.ajax({
      url: url,
      method: 'GET',
      contentType: 'application/json',
      dataType: 'json',
      success: function(response) {
        populateTable(response);
      }
    });
  };

  var ajaxReviews = function(){
    $.ajax({
      url: "/reviews",
      method: 'GET',
      contentType: 'application/json',
      dataType: 'json',
      success: function(response) {
        populateRow(response);
      }
    });
  };

  var populateRow = function(response) {
    $.each(response, function(index, el) {
      var $movieRow = $('<tr>');
      var $td2 = $('<td>').text(el.title);
      $movieRow.append($td2);
      var $td3 = $('<td>').text(el.reviewer_name);
      $movieRow.append($td3);
      var $td4 = $('<td>').text(el.review_text);
      $movieRow.append($td4);
      $movie = $('[data-id="' + el.movie_id + '"]')
      $movie.append($movieRow);
    });
  };

  var populateTable = function(response) {
    $.each(response, function(index, el) {
      var $movieListing = $('<li>').text(el.title).attr('data-id', el.id);
      $('ul').append($movieListing);
    });
  };

  stub.addMovie = function(movieData) {
    $.ajax({
      url: "/movies",
      method: 'POST',
      data: JSON.stringify({
        movie: { title: movieData }
      }),
      contentType: 'application/json',
      dataType: 'json',
      success: function(response) {
        populateTable([response]);
      },
      error: function(response) {
        console.log(response);
      }
    });
  };

  stub.addMovieListener = function() {
    $('input[type="submit"]').on('click', function(e) {
      e.preventDefault();
      var movieTitle = $('input[type="text"]').val();
      stub.addMovie(movieTitle);
    });
  };

  var addPageListener = function() {
    $('.pagination').on('click', 'a', function(e){
        e.preventDefault();
        console.log(e.target);
        var url = $(e.target).attr('href');
        ajaxMovies(url);
    });
  };

  var scrollLoad = function(){
    var counter = 2;

    // this triggers whenever you scroll
    $(window).scroll(function(){
      // if you're at the bottom of the page
      if  ($(window).scrollTop() == $(document).height() - $(window).height()){
        ajaxMovies("/?page="+counter);
        // ajaxReviews();
        counter++;
      }
    });
  };


  return stub;
})();
