DominionStrategyClone.Views.Search = Backbone.View.extend({
  template: JST['searches/new'],
  render: function(){
    var renderedContent = this.template({})
    this.$el.html(renderedContent)
    return this;
  }

})
