var ReviewModule = ( function(){

  var inserData = function(data){
    var _table = $("#movies");
    _table.append(data);
  };

  return {
    inserData: inserData
  }

})();
