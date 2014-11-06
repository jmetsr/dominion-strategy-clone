DominionStrategyClone.Views.ReplyEdit = Backbone.View.extend({

  template: JST['replies/edit'],
  render: function(){

    console.log(this.model.get('user_id'))
    console.log(this.model)
    if (DominionStrategyClone.loggedIn && DominionStrategyClone.currentUserId === this.model.get('user_id')) {
      $('#errors').html("")
      var renderedContent = this.template({
        reply: this.model
      })
      console.log('if condition is true')
      this.$el.html(renderedContent);
    } else {
      $('#errors').html("Sorry, you don't have permission to access that section")
    }

    return this;
  },
  initialize: function(){
    this.model.fetch()
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
