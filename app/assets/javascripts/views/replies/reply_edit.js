DominionStrategyClone.Views.ReplyEdit = Backbone.View.extend({
  url: 'api/replies',
  template: JST['replies/edit'],
  render: function(){
    if (this.model.get('user_id') === parseInt(DominionStrategyClone.currentUserId)){
      var renderedContent = this.template({
        reply: this.model
      })
      this.$el.html(renderedContent);
    } else {
      Backbone.history.navigate('#', {trigger: true});
    }

    return this;
  },
  initialize: function(){
    this.listenTo(this.model, 'sync', this.render)
    console.log('initialies the view')
  },
  events: {
      'submit form': 'editReply'
  },
  editReply: function(){
    var that = this;
    event.preventDefault();
    cont = this.$("#content").val();

    this.model.save({content: cont},{
      success: function(){
        Backbone.history.navigate("#/topics/" + that.model.get('topic_id'), {trigger: true});
      },
      error: function(){
        alert("Invalid fields, try again");
        console.log(that.model.attributes)
       }
     })
   }
 })
