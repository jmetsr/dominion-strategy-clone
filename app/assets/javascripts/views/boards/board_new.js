DominionStrategyClone.Views.BoardNew = Backbone.View.extend({
  template: JST['boards/new'],
  render: function(){
    var renderedContent = this.template()
    this.$el.html(renderedContent)
    return this;
  },

  events: {
      'submit form': 'createBoard'
  },

  createBoard: function(){
    event.preventDefault();
    identifier = this.$("#title").val();
    board = new DominionStrategyClone.Models.Board;

    board.save({admin_id: DominionStrategyClone.currentUserId, title: identifier},{
      success: function(){
        console.log("success")
        Backbone.history.navigate("#", {trigger: true});
      },
      error: function(){
        alert("That's not a valid board title, try again");
      }
    })
  }
})
