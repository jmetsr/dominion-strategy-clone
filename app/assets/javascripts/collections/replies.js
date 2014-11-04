DominionStrategyClone.Collections.Replies = Backbone.Collection.extend({
  model: DominionStrategyClone.Models.Reply,
  url: 'api/replies',
  getOrFetch: function(id){
    var reply = this.get(id);
    if (!reply){
      reply = new DominionStrategyClone.Models.Reply({id: id});
      reply.fetch({
        success: function(){
          this.add(reply);
        }.bind(this)
      });
    } else {
      reply.fetch();
    }
    return reply;
  }
})

DominionStrategyClone.Collections.replies = new DominionStrategyClone.Collections.Replies
