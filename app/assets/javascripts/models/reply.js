DominionStrategyClone.Models.Reply = Backbone.Model.extend({
  urlRoot: 'api/replies',
  user: function(){
    if (!this._user){
      this._user = new DominionStrategyClone.Models.User();
      this._user.id = this.user_id;
    }
    this._user.fetch();
    return this._user;
  },
  topic: function(){
    console.log()
    if (!this._topic){
      this._topic = new DominionStrategyClone.Models.Topic();
      this._topic.id = this.topic_id;
    }
    this._topic.fetch();
    return this._topic;
  },

  parse: function(response){
    if (response.topic){
      this.topic().set(response.topic, { parse: true});
      delete response.topic;
    }
    if (response.user){
      this.user().set(response.user, { parse: true});
      delete response.user;
    }
    return response;
  }
})
