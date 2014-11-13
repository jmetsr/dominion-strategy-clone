DominionStrategyClone.Routers.Router = Backbone.Router.extend({
  initialize: function(){
    this.$rootEl = $('#main');
  //  console.log('hello from the router')
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
    'replies/:id/edit': 'replyEdit',
    'notifications': 'notificationIndex'
    'search':'searchNew'
  },

  boardsIndex: function(){
    $('#errors').html("")
    var indexView = new DominionStrategyClone.Views.BoardsIndex({
      collection: DominionStrategyClone.Collections.boards
    })
    DominionStrategyClone.Collections.boards.fetch();
    this._swapView(indexView);
  },

  boardShow: function(id){
    $('#errors').html("")
    var board = DominionStrategyClone.Collections.boards.getOrFetch(id);
    var showView = new DominionStrategyClone.Views.BoardShow({
      model: board
    });
    this._swapView(showView)
  },

  boardNew: function(){
    $('#errors').html("")
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
    $('#errors').html("")
    var board = DominionStrategyClone.Collections.boards.getOrFetch(id);
    if (DominionStrategyClone.isAdmin) {
      var editView = new DominionStrategyClone.Views.BoardEdit({
        model: board
      });
      this._swapView(editView);
    } else {
      $('#errors').html("You need to be an admin to access this section")
      var indexView = new DominionStrategyClone.Views.BoardsIndex({
        collection: DominionStrategyClone.Collections.boards
      })
      this._swapView(indexView);
    }
  },

  topicShow: function(id){
    $('#errors').html("")
    var topic = DominionStrategyClone.Collections.topics.getOrFetch(id);
    var showView = new DominionStrategyClone.Views.TopicShow({
      model: topic
    });
    this._swapView(showView)
  },

  topicNew: function(id){
    $('#errors').html("")
    var board = DominionStrategyClone.Collections.boards.getOrFetch(id);
    if (DominionStrategyClone.loggedIn) {
      var newView = new DominionStrategyClone.Views.TopicNew({
        model: board,
        topic: new DominionStrategyClone.Models.Topic
      });
      this._swapView(newView);
    } else {
      document.location.href='/session/new?no_access=true';
    }
  },

  topicEdit: function(id){
    $('#errors').html("")
      var topic = DominionStrategyClone.Collections.topics.getOrFetch(id);
      var editView = new DominionStrategyClone.Views.TopicEdit({
        model: topic
      });
      this._swapView(editView);
  },

  replyNew: function(id){
    $('#errors').html("")
    if (DominionStrategyClone.loggedIn){
      var topic = DominionStrategyClone.Collections.topics.getOrFetch(id);
      var newView = new DominionStrategyClone.Views.ReplyNew({
        model: topic,
        reply: new DominionStrategyClone.Models.Reply
      });
      this._swapView(newView)
    } else {
        document.location.href='/session/new?no_access=true';
      }
  },

  replyEdit: function(id){
    $('#errors').html("")
    var reply = DominionStrategyClone.Collections.replies.getOrFetch(id);

    var editView = new DominionStrategyClone.Views.ReplyEdit({
      model: reply
    });
    this._swapView(editView);
  },
  notificationIndex: function(){
    $('#errors').html("");
    var indexView = new DominionStrategyClone.Views.NotificationsIndex({
      collection: DominionStrategyClone.Collections.notifications
    });
    DominionStrategyClone.Collections.notifications.fetch();
    this._swapView(indexView);
  },
  searchNew: function(){
    $('#errors').html("");
    var searchView = new DominionStrategyClone.Views.Search({});
    this.swapView(searchView)
  },

  _swapView: function(view){
  //  console.log(view.initialize)
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);

  }
})
