DominionStrategyClone.Views.NotificationsIndex = Backbone.View.extend({
  url: 'api/notifications',
  template: JST["notifications/index"],
  render: function(){
    var renderedContent = this.template({
      notifications: this.collection
    })
    this.$el.html(renderedContent)
    return this;
  },
  initialize: function(){
    this.listenTo(this.collection, 'sync', this.render);
  }

})
