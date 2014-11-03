DominionStrategyClone.Views.BoardsIndex = Backbone.View.extend({

  url: 'api/boards',
  template: JST['boards/index'],
  render: function(){
    var renderedContent = this.template({
      boards: this.collection
    })
    this.$el.html(renderedContent)
    return this;
  },
  initialize: function(){
    this.listenTo(this.collection, 'sync', this.render)
    this.collection.fetch();
  }


})
