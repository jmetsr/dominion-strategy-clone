DominionStrategyClone.Views.BoardEdit = Backbone.View.extend({

  url: 'api/boards',
  template: JST['boards/edit'],
  render: function(){
    var renderedContent = this.template({
      board: this.model
    })
    console.log("hello from edit")
    this.$el.html(renderedContent)
    return this;
  },
  initialize: function(){
    this.model.fetch()
    this.listenTo(this.model, 'sync', this.render)
  },
  events: {
      'submit form': 'editBoard'
  },
  editBoard: function(){
    event.preventDefault();
    identifier = this.$("#title").val();
    this.model.save({title: identifier, id: this.model.get("id")},{
      success: function(){},
      error: function(){
        alert("That's not a valid board title, try again");
      }
    })
  }
})
