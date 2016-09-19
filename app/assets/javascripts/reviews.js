$(document).ready(function(){
  if($("#reviews-index").length){
    scrollingModule.init();
  }
})

var scrollingModule = (function(){
  var currentPage = 1;
  var init = function(){
    currentPage = 1;
    $(window).scroll(function(){
    if($(window).scrollTop() == $(document).height() - $(window).height()){
      console.log("hello");
      //make a get request for the next page
      getNextPage();
      //add it to this page's html
    }
    }); 
  };
  var getNextPage = function(){
    $.ajax({
      url: "/reviews",
      type: "GET",
      dataType: "script",
      data: {page: currentPage + 1},
      success: function(){ currentPage++;}
    })
  };
  return{
    init: init
  }
})();
