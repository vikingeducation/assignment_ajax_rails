

var devURL = "http://localhost:3000";

var moviesIndex = (function() {

  $.get({
    url: devURL + "/movies.json",
    dataType: "json",
    success: function(json) {
      fillTable(json)
    }


  })


})();


var fillTable = function(json) {

  for (var i = 0; i < json.length; i++) {
    $('.table-body').append("<tr><td>"+json[i]["title"]+"</td><td>"+ json[i]["release_date"].slice(0,10)+"</td></tr>")
  }







}










$(document).ready(function() {
  if ($("#movies-index").length) {

  }


})