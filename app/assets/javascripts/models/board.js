DominionStrategyClone.Models.Board = Backbone.Model.extend({
  urlRoot: '/api/boards',

  topics: function(){
    if (!this._topics){
      this._topics = new DominionStrategyClone.Collections.Topics([], { board: this });
    }

    return this._topics
  },


  parse: function(response){
   if (response.topics){
      this.topics().set(response.topics, { parse: true });
      delete response.topics;
    }
    return response;
  }
})
