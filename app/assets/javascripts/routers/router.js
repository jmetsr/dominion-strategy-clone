DominionStrategyClone.Routers.Router = Backbone.Router.extend({
  initialize: function(){
    this.$rootEl = $('#main');
    console.log('hello from the router')
  },
  routes: {
    '': 'boardsIndex',
    'boards/new': 'boardNew',
    'boards/:id': 'boardShow',
    'boards/:id/edit': 'boardEdit'
  },

  boardsIndex: function(){
    var indexView = new DominionStrategyClone.Views.BoardsIndex({
      collection: DominionStrategyClone.Collections.boards
    })
    this._swapView(indexView);
  },

  boardShow: function(id){
    var board = DominionStrategyClone.Collections.boards.getOrFetch(id);
    var showView = new DominionStrategyClone.Views.BoardShow({
      model: board
    });
    this._swapView(showView)

  },

  boardNew: function(){
    if (DominionStrategyClone.isAdmin) {
      var newView = new DominionStrategyClone.Views.BoardNew;
      this._swapView(newView);
    } else {
      var indexView = new DominionStrategyClone.Views.BoardsIndex({
        collection: DominionStrategyClone.Collections.boards
      })
      this._swapView(indexView);
    }
  },

  boardEdit: function(id){
    var board = DominionStrategyClone.Collections.boards.getOrFetch(id);
    if (DominionStrategyClone.isAdmin) {
      var editView = new DominionStrategyClone.Views.BoardEdit({
        model: board
      });
      this._swapView(editView);
    } else {
      var indexView = new DominionStrategyClone.Views.BoardsIndex({
        collection: DominionStrategyClone.Collections.boards
      })
      this._swapView(indexView);
    }
  },

  _swapView: function(view){
    console.log("hello from swap view")
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
})
