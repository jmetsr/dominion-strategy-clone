DominionStrategyClone.Views.TopicLI = Backbone.View.extend({
  template: JST['topics/li'],

  initialize: function (topic) {
    this.topic = topic;
    console.log('topic Li view initialized')
  },

  tagName: 'li',

  render: function () {
    console.log('topic Li view rendered')
    var renderedContent = this.template({topic: this.topic});
    this.$el.html(renderedContent);
    return this;
  }
});
