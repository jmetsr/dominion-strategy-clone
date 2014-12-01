DominionStrategyClone.Views.ReplyLI = Backbone.View.extend({
  template: JST['replies/li'],

  initialize: function (reply) {
    this.reply = reply;
  },

  tagName: 'li',

  render: function () {
    var renderedContent = this.template({reply: this.reply});

    this.$el.html(renderedContent);

    return this;
  }
});
