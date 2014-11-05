DominionStrategyClone.Views.TopicNew = Backbone.View.extend({
  template: JST['topics/new'],
  render: function(){
    var renderedContent = this.template({
      board: this.model,
      topic: this.topic
    })
    this.$el.html(renderedContent)
    return this;
  },

  events: {
      'submit form': 'createTopic'
  },

  createTopic: function(){
    var that = this;
    event.preventDefault();
    titl = this.$("#title").val();
    bod = this.$("#body").val();
    this.topic.save({user_id: DominionStrategyClone.currentUserId,
       title: titl, body: bod, board_id: this.model.get('id')},{
      success: function(){
        Backbone.history.navigate('#topics/' + that.topic.get('id'), {trigger: true});
      },
      error: function(){
        alert('in valid fields, try again')
      }
    })
  },

  initialize: function(options){
    this.topic = options.topic;
    this.listenTo(this.model, 'sync', this.render)
    this.model.fetch()
  }
})
