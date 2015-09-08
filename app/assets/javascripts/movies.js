$(document).ready(function(){
  $.ajax({
    method: "GET",
    url: "movies.json",
    dataType: "json",
    contentType: "application/json",
    success: function (json) {
      for (var i = 0; i < json.length; i++) {
        json[i].name
        json[i].release_date
      };
      $("#movies").append("<tr><td>...</td></tr>")

    }
  })
})