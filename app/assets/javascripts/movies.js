MovieModule = {
  addRows: function(data){
    if (data instanceof Array) {
      for (var i = 0; i < data.length; i++) {
        var $row = $("<tr><td>"+data[i].title+"</td><td>"+data[i].release_date+"</td></tr>");
        $row.appendTo($("table"));
      };
    } else {
      var $row = $("<tr><td>"+data.title+"</td><td>"+data.release_date+"</td></tr>");
      $row.appendTo($("table"));
    };
  },

  makeRequest: function() {
    $.get(window.location.origin+"/movies.json", null,
            function(data){MovieModule.addRows(data)});
  },

  formListener: function() {
    $("form[data-ajaxremote='true']").submit( function( event ){

      event.preventDefault();

      // Pull the data off the form
      var $form = $( event.target );
      var formData = $form.serializeArray();


      $.ajax({
        url: $form.attr("action"),
        method: "POST",
        data: formData,
        dataType: "json",
        success: function( data ){
          console.log( "Success!" );
          MovieModule.addRows(data);
        }
      });

    });
  },

}


$( document ).ready( function(){
  if (window.location.pathname === "/movies") {
    MovieModule.makeRequest();
    MovieModule.formListener();
  };

});
