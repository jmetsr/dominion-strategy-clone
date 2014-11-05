DominionStrategyClone.Views.ReplyNew = Backbone.View.extend({

  url: 'api/replies',
  template: JST['replies/new'],
  render: function(){
    var renderedContent = this.template({
      topic: this.model,
      reply: new DominionStrategyClone.Models.Reply
    })
    this.$el.html(renderedContent)
    return this;
  },
  initialize: function(options){
    this.reply = options.reply
    this.listenTo(this.model, 'sync', this.render)
    this.model.fetch();
  },
  events: {
      'submit form': 'createReply'
  },
  createReply: function(){
    event.preventDefault();
    cont = this.$('#content').val();
    id = this.model.get('id');
    this.reply.save({user_id: DominionStrategyClone.currentUserId, content: cont, topic_id: id},{
      success: function(){
        Backbone.history.navigate('#/topics/'+ id,{ trigger: true })
      },
      error: function(){
        alert('invalid, try again')
      }
    })
  }
})
