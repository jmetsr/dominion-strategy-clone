DominionStrategyClone.Collections.Boards = Backbone.Collection.extend({
  model: DominionStrategyClone.Models.Board,
  url: 'api/boards',
  getOrFetch: function(id){
    var board = this.get(id);
    if (!board){
      board = new DominionStrategyClone.Models.Board({id: id});
      board.fetch({
        success: function(){
          this.add(board);
        }.bind(this)
      });
    } else {
      board.fetch();
    }
    return board;
  }
})

DominionStrategyClone.Collections.boards = new DominionStrategyClone.Collections.Boards