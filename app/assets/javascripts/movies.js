// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var APP = APP || {};

APP.module = (function (){

  var stub = {};

  stub.init = function () {
    createMovie();
    getMovies();
  };

  var _insertData = function (data) {
    $.each(data, function (i, movie) {
      $("table").append("<tr> <td>"+ movie.title +"</td><td>" + movie.release_date + "</td></tr>");
    });
  }

  function getMovies () {
    $(function () {
      $.ajax({
        url: "/movies.json",
        type: "GET",
        success: function (data) {
          _insertData(data);
        },
        error: function () {
          alert("Something went wrong");
        }
      })
    });
  }

  function createMovie () {
    $("form").submit( function ( event ) {
      event.preventDefault();
      //debugger
      var $el = $(event.target);

      var _data = $(this).serializeArray();

        $.ajax({
          url: "/movies",
          type: "POST",
          dataType: "json",
          data: _data,
          success: function (obj) {
              $("table").prepend("<tr> <td>"+ obj.title +"</td><td>" + obj.release_date + "</td></tr>");
              $("#movie_title").val('');
          },
          error: function () {
            console.log("Error Errorr");
          }
        });
        return false;
    });
  }

  return stub

})();

$(document).ready( function () {
  if( $("body").data("controller") == "movies"){
    APP.module.init();
  }
});
