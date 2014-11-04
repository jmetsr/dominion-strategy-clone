window.DominionStrategyClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new DominionStrategyClone.Routers.Router
    Backbone.history.start();
  }
};
