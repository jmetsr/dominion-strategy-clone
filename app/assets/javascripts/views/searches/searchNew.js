DominionStrategyClone.Views.Search = Backbone.View.extend({
  initialize: function(){
    this.results = new DominionStrategyClone.Collections.Searches();
    this.listenTo(this.results, 'sync', this.render);
  },
  template: JST['searches/new'],
  render: function(){
    var renderedContent = this.template();
    this.$el.html(renderedContent);

    var resultsContainer = this.$('#search-results');

    this.results.each(function (result) {

      var view;
      console.log(result.attributes)
      console.log(DominionStrategyClone.Models.Reply)
      console.log(result instanceof DominionStrategyClone.Models.Reply)
      if (result instanceof DominionStrategyClone.Models.Reply) {
        view = new DominionStrategyClone.Views.ReplyLI(result);
      } else {
        view = new DominionStrategyClone.Views.TopicLI(result);
      }
      resultsContainer.append(view.render().$el);

    });
    return this;
  },
  events: {
    'submit form': 'conductSearch'
  },
  conductSearch: function(){
    event.preventDefault();
    this.query = this.$("#s").val();
    this.results.fetch({
      data: {
        query: this.query
      }
    });
    console.log(this.query);

  }

})
