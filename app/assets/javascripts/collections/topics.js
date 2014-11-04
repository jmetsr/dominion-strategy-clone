DominionStrategyClone.Collections.Topics = Backbone.Collection.extend({
  model: DominionStrategyClone.Models.Topic,
  url: 'api/topics',
  getOrFetch: function(id){
    var topic = this.get(id);
    if (!topic){
      topic = new DominionStrategyClone.Models.Topic({id: id});
      topic.fetch({
        success: function(){
          this.add(topic);
        }.bind(this)
      });
    } else {
      topic.fetch();
    }
    return topic;
  }
})

DominionStrategyClone.Collections.topics = new DominionStrategyClone.Collections.Topics