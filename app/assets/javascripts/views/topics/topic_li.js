DominionStrategyClone.Views.TopicLI = Backbone.View.extend({
  template: JST['topics/li'],

  initialize: function (topic) {
    this.topic = topic;
  },

  tagName: 'li',

  render: function () {
    var renderedContent = this.template({topic: this.topic});
    this.$el.html(renderedContent);
    return this;
  }
});
