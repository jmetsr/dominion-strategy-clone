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
    'topics/:id/edit': 'topicEdit',
    'topics/:id/replies/new': 'replyNew',
    'boards/:id/topics/new': 'topicNew',
    'replies/:id/edit': 'replyEdit'
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

  topicEdit: function(id){
      var topic = DominionStrategyClone.Collections.topics.getOrFetch(id);
      var editView = new DominionStrategyClone.Views.TopicEdit({
        model: topic
      });
      this._swapView(editView);
  },

  replyNew: function(id){
    if (DominionStrategyClone.loggedIn){
      var topic = DominionStrategyClone.Collections.topics.getOrFetch(id);
      var newView = new DominionStrategyClone.Views.ReplyNew({
        model: topic,
        reply: new DominionStrategyClone.Models.Reply
      });
      this._swapView(newView)
    } else {
        var indexView = new DominionStrategyClone.Views.BoardsIndex({
          collection: DominionStrategyClone.Collections.boards
        })
        this._swapView(indexView);
      }
  },

  replyEdit: function(id){
    console.log("hello from replyEdit")
    var reply = DominionStrategyClone.Collections.replies.getOrFetch(id);
    var editView = new DominionStrategyClone.Views.ReplyEdit({
      model: reply
    });
    this._swapView(editView);
    console.log("swapped the view")
  },

  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
})
