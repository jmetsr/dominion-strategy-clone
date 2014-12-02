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

      if (!!result.attributes.topic){
        view = new DominionStrategyClone.Views.TopicLI(result);
        resultsContainer.append(view.render().$el);
      }

      if (!!result.attributes.reply) {
        console.log('result.reply')
        view = new DominionStrategyClone.Views.ReplyLI(result);
        resultsContainer.append(view.render().$el);
      }



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
