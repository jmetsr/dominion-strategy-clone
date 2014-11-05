DominionStrategyClone.Models.Reply = Backbone.Model.extend({
  urlRoot: '/api/replies',
  user: function(){
    if (!this._user){
      this._user = new DominionStrategyClone.Models.User();
      this._user.id = this.user_id
    }
    this._user.fetch()
    return this._user
  },

  parse: function(response){
    if (response.user){
      this.user().set(response.user, { parse: true });
    }
    return response;
  }
})
