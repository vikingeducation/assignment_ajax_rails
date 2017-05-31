var SiteModule = (function() {
  var init = function() {
    _listenForFlashClose();
  }

  var _listenForFlashClose = function() {
    $('button[data-dismiss="alert"]').on('click', function() {
      $(this).parent('.alert').remove();
    })
  }
  return {
    init: init
  }
})();

$(document).ready(function() {
  var controller = $('body').data('controller')
  if (controller == 'movies' || controller == 'reviews') {

    SiteModule.init();
  }
})