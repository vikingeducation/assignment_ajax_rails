var MoviesView = (function () {
  var _$movieTable;

  var init = function() {
    _cacheDOM();
  };

  var _cacheDOM = function() {
    _$movieTable = $('[data-movies-table]').eq();
    console.log(_$movieTable);
  };

})();
