DominionStrategyClone.Models.Topic = Backbone.Model.extend({
  urlRoot: 'api/topics',

  replies: function(){
    if (!this._replies){
      this._replies = new DominionStrategyClone.Collections.Replies([], { topic: this });
    }

    return this._replies
  },

  parse: function(response){
   if (response.replies){
      this.replies().set(response.replies, { parse: true });
      delete response.replies;
    }
    return response;
  }
})
