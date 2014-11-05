DominionStrategyClone.Views.TopicEdit = Backbone.View.extend({
  url: 'api/topics',
  template: JST['topics/edit'],
  render: function(){
    var userid = DominionStrategyClone.currentUserId;
    if (this.model.get('user_id')){
      console.log(this.model.get('user_id'))
      console.log(userid)
      if (this.model.get('user_id') === userid){
        var renderedContent = this.template({
          topic: this.model
        })
        this.$el.html(renderedContent)
      } else {
        Backbone.history.navigate('#', {trigger: true})
      }
    }

    return this;
  },
  initialize: function(){
    this.listenTo(this.model, 'sync', this.render)
  },
  events: {
      'submit form': 'editTopic'
  },
  editTopic: function(){
    var that = this;
    event.preventDefault();
    titl = this.$("#title").val();
    bod = this.$("#body").val();
    this.model.save({title: titl, id: this.model.get("id"), body: bod },{
      success: function(){
        Backbone.history.navigate("#/topics/" + that.model.get('id'), {trigger: true});
      },
      error: function(){
        alert("Invalid fields, try again");
      }
    })
  }
})
