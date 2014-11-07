DominionStrategyClone.Collections.Notifications = Backbone.Collection.extend({
  model: DominionStrategyClone.Models.Notification,
  url: 'api/notifications',
  getOrFetch: function(id){
    var notification = this.get(id);
    if (!notification){
      notification = new DominionStrategyClone.Models.Notification({id: id});
      notification.fetch({
        success: function(){
          this.add(notification);
        }.bind(this)
      });
    } else {
      notification.fetch();
    }
    return notification;
  }
})

DominionStrategyClone.Collections.notifications = new DominionStrategyClone.Collections.Notifications
