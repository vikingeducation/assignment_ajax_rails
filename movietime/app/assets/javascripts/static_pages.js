
//COPY PASTED 3 GUTS INTO FOUR; NEED TO DELETE PUPPY ON CLICK

var myAjax = {
  init: function(){
    $.ajax( {
        url: "http://localhost:3000/movies.json",
        type: "GET",
        dataType : "json",

        success: function( json ) {
          json.forEach(function(movie){
            alert("we are in the for each");
            $("#my-movies").append("<tr><td>" + movie.name + "</td><td>" + movie.release_date + "</td></tr>");
          });
        },

        error: function( xhr, status, errorThrown ) {
          $("#puppy-container").append("<h3>Error thrown, it is: " + errorThrown + " </h3>");
            console.log( "Error: " + errorThrown );
            console.log( "Status: " + status );
            console.dir( xhr );
        },

        complete: function( xhr, status ) {
            console.log( "The request is complete!" );
        }
      });

    //AJAX TWO, REFRESH ALL PUPPIES BELOW

  //   $("#refresh-puppies").click(function(e){
  //     myAjax.suchRefresh();
  //   });

  //     //AJAX THREE: USER INPUT
  //   $("#dog-form").submit(function(e){
  //     var postData = $(this).serializeArray();
  //     postData = ({name: postData[0].value, breed_id: postData[1].value });
  //     postData = JSON.stringify(postData);
  //     $.ajax( {

  //       url: "https://pacific-stream-9205.herokuapp.com/puppies.json",
  //       data: postData,
  //       type: "POST",
  //       contentType: "application/json",
  //       dataType: "json",

  //       success: function( dog ) {
  //     //STILL NEED BREED NAME
  //           $("#puppy-container").append("<p>Name: " + dog.name + ", Breed: " + dog.breed_id + "</p>");
  //       },

  //       error: function( xhr, status, errorThrown ) {
  //          $("#puppy-container").append("<h3>Error thrown, it is: " + errorThrown + " </h3>");
  //           console.log( "Error: " + errorThrown );
  //           console.log( "Status: " + status );
  //           console.dir( xhr );
  //       },

  //       complete: function( xhr, status ) {
  //           console.log( "The request is complete!" );
  //       }
  //     });
  //     e.preventDefault();
  //   });

  //   //AJAX FOUR: ADOPT PUPPIES

  //   $( "#puppy-container" ).on( "click", ".adopt", function(){
  //     console.log("clickage!");
  //     var whichPup = this.id;

  //     $.ajax( {

  //       url: 'https://pacific-stream-9205.herokuapp.com/puppies/' + whichPup + '.json',
  //       type: "DELETE",
  //       contentType: "application/json",
  //       dataType: "json",

  //       success: function() {
  //           myAjax.suchRefresh();
  //       },

  //       error: function( xhr, status, errorThrown ) {
  //          $("#puppy-container").append("<h3>Error to delete thrown, it is: " + errorThrown + " </h3>");
  //          myAjax.producedError = errorThrown;
  //           console.log( "Error: " + errorThrown );
  //           console.log( "Status: " + status );
  //           console.dir( xhr );
  //       },

  //       complete: function( xhr, status ) {
  //           console.log( "The request is complete!" );
  //       }
  //     });
  //   });
  // },

  // suchRefresh: function(){
  //   $.ajax( {

  //     url: "https://pacific-stream-9205.herokuapp.com/puppies.json",
  //     type: "GET",
  //     dataType : "json",

  //     success: function( json ) {
  //         $("#puppy-container").html("")
  //         json.forEach(function(dog){
  //           $("#puppy-container").append("<p>Name: " + dog.name + ", Breed: " + dog.breed.name + "<div class=\"adopt\" id =\"" + dog.id + "\">adopt</div></p>");
  //         });

  //     },

  //     error: function( xhr, status, errorThrown ) {
  //         $("#puppy-container").append("<h3>Error thrown, it is: " + errorThrown + " </h3>");
  //         console.log( "Error: " + errorThrown );
  //         console.log( "Status: " + status );
  //         console.dir( xhr );
  //     },

  //     complete: function( xhr, status ) {
  //         console.log( "The request is complete!" );
  //     }
  //   });
  // },

  // clearClass: function(){
  //   $("#ajax-status-indicator").removeClass("yellow").removeClass("green").removeClass("red")
  // },

  // finishedOrError: false,

  // producedError: "none"
}

$( document ).ready(function() {
  alert("ajax city");
  myAjax.init();
});