DominionStrategyClone.Models.Reply = Backbone.Model.extend({
  urlRoot: 'api/replies',
  user: function(){
    if (!this._user){
      this._user = new DominionStrategyClone.Models.User();
      this._user.id = this.user_id;
    }
//    this._user.fetch();
    return this._user;
  },
  topic: function(){
    if (!this._topic){
      this._topic = new DominionStrategyClone.Models.Topic();
      this._topic.id = this.topic_id;
    }
  //  this._topic.fetch();
    return this._topic;
  },
  notifications: function(){
  //  console.log(!!this._notifications)
    if (!this._notifications){
      this._notifications = new DominionStrategyClone.Collections.Notifications();
    }
  //  console.log(typeof this._notifications)
    return this._notifications;
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
    if (response.notifications){

       this.notifications().set(response.notifications, {parse: true});
    //  var notifics = this.notifications();
    //  (notifics().set).apply(notifics, response.notifications.models())
      delete response.notifications;
    }
    return response;
  }
})
