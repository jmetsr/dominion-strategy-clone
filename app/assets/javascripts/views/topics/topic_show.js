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
    this.listenTo(this.model, 'sync', this.render)
    this.model.fetch();
  },
  events: {
    'submit form': 'destroyTopic'
  },
  destroyTopic: function(){
    var board_id = this.model.get('board_id');
    event.preventDefault();
    this.model.destroy();
    Backbone.history.navigate("#boards/"+ board_id, {trigger: true})
  }


})
