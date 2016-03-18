var moviesIndex = function() {

  $.get({
    url:  "/movies.json",
    dataType: "json",
    success: function(json) {
      fillTable(json);
    }
  });

};


var fillTable = function(json) {

  // use jQuery to add stuff first, append to DOM at the end
  for (var i = json.length - 1; i >= 0; i--) {
    $('.table-body').append("<tr><td>"+json[i].title + "</td><td>"+ json[i].release_date.slice(0,10)+"</td></tr>");
  }

};


$(document).ready(function() {
  if ($("#movies-index").length) {
    moviesIndex();
  }

});
