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
  }


})
