DominionStrategyClone.Collections.Searches = Backbone.Collection.extend({

  model: function (attrs) {
    var type = attrs._type;


    if (type === 'Topic') {
        return new DominionStrategyClone.Models.Topic(attrs);
      } else if (type === 'Reply') {
        return new DominionStrategyClone.Models.Reply(attrs);
      } else {
        return new Backbone.Model(attrs)
      }
    delete attrs._type;
  },

  url: '/api/searches'
})
