'use strict;'

var APP = APP || {};

APP.MainModule = (function(){

  var controller;

  function init(){
    _getController();

    if (controller === 'movies'){
      APP.MovieModule.init();
    }
  }

  function _getController(){
    controller = $('body').attr('data-controller');
  }

  return {
    init: init
  };
})();