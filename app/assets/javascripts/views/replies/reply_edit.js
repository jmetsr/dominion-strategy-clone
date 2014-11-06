DominionStrategyClone.Views.ReplyEdit = Backbone.View.extend({
  url: 'api/replies',
  template: JST['replies/edit'],
  render: function(){
    console.log('rendered the view')
    var renderedContent = this.template({
      reply: this.model
    })
    this.$el.html(renderedContent)
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
    this.model.save({content: cont, id: this.model.get("id"), topic_id: this.model.get("topic_id")},{
      success: function(){
        Backbone.history.navigate("#/topics/" + that.model.get('topic_id'), {trigger: true});
      },
      error: function(){
        alert("Invalid fields, try again");
       }
     })
   }
 })
