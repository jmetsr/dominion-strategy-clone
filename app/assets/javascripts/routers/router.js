DominionStrategyClone.Routers.Router = Backbone.Router.extend({
  initialize: function(){
    this.$rootEl = $('#main');
    console.log('hello from the router')
  },
  routes: {
    '':'boardsIndex'
  },

  boardsIndex: function(){
    DominionStrategyClone.Collections.boards.fetch();
    var indexView = new DominionStrategyClone.Views.BoardsIndex({
      collection: DominionStrategyClone.Collections.boards
    });
    console.log("boards Index")
    this._swapView(indexView);
  },

  _swapView: function(view){
    console.log("hello from swap view")
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
})