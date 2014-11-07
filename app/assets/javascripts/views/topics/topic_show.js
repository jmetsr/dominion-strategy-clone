DominionStrategyClone.Views.TopicShow = Backbone.View.extend({

  template: JST['topics/show'],
  render: function(){
    var renderedContent = this.template({
      topic: this.model
    })
    this.$el.html(renderedContent)
    return this;

  },
  initialize: function(){
    var that = this;
    this.listenTo(this.model, 'sync', this.render)
    this.model.fetch({
      success: function(){
        DominionStrategyClone.all_read = true;
        that.model.replies().each(function(reply){
          reply.notifications().each(function(notification){
            if (notification.get('user_id') === DominionStrategyClone.currentUserId){
              notification.save({is_read: true});
              console.log('set succsessfull')
            }
            else {
              DominionStrategyClone.all_read = false;
            }
          })
        })
        if (DominionStrategyClone.all_read){
          $('#notifications').html("")
        }
      }
    });

  },
  events: {
    'submit form': 'destroyTopic',
    'click button': 'removeReply'
  },
  destroyTopic: function(){
    var board_id = this.model.get('board_id');
    event.preventDefault();
    this.model.destroy();
    Backbone.history.navigate("#boards/"+ board_id, {trigger: true})
  },
  removeReply: function(){
    event.preventDefault();
    var id = parseInt(event.target.id);
    this.model.replies().get(id).destroy();
    this.render();
  }


})
