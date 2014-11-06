DominionStrategyClone.Models.Topic = Backbone.Model.extend({
  urlRoot: 'api/topics',

  replies: function(){
    if (!this._replies){
      this._replies = new DominionStrategyClone.Collections.Replies([], { topic: this });
    }

    return this._replies
  },

  board: function(){
    if (!this._board){
      this._board = new DominionStrategyClone.Models.Board();
      this._board.id = this.board_id
    }
    this._board.fetch()
    return this._board
  },

  user: function(){
    if (!this._user){
      this._user = new DominionStrategyClone.Models.User();
      this._user.id = this.user_id
    }
    this._user.fetch()
    return this._user
  },

  parse: function(response){
   if (response.replies){
      this.replies().set(response.replies, { parse: true });
      this.user().set(response.user, { parse: true });
      this.board().set(response.board, { parse: true });
      delete response.replies;
    }
    return response;
  }
})
