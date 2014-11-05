DominionStrategyClone.Routers.Router = Backbone.Router.extend({
  initialize: function(){
    this.$rootEl = $('#main');
    console.log('hello from the router')
  },
  routes: {
    '': 'boardsIndex',
    'boards/new': 'boardNew',
    'boards/:id': 'boardShow',
    'boards/:id/edit': 'boardEdit',
    'topics/:id': 'topicShow',
    'boards/:id/topics/new': 'topicNew'
  },

  boardsIndex: function(){
    var indexView = new DominionStrategyClone.Views.BoardsIndex({
      collection: DominionStrategyClone.Collections.boards
    })
    DominionStrategyClone.Collections.boards.fetch();
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
      $('#errors').html("You need to be an admin to access this section")
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

  topicShow: function(id){
    var topic = DominionStrategyClone.Collections.topics.getOrFetch(id);
    var showView = new DominionStrategyClone.Views.TopicShow({
      model: topic
    });
    this._swapView(showView)
  },

  topicNew: function(id){
    var board = DominionStrategyClone.Collections.boards.getOrFetch(id);
    if (DominionStrategyClone.loggedIn) {
      var newView = new DominionStrategyClone.Views.TopicNew({
        model: board,
        topic: new DominionStrategyClone.Models.Topic
      });
      this._swapView(newView);
    } else {
      $('#errors').html("You need to be an logged in to access this section")
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
