class Api::NotificationsController < ApplicationController
  def show
    @notification = current_user.notifications.find(params[:id])
    render :show
  end
  def index
    @notifications = logged_in && current_user.notifications
    render :index
  end
  def create
    @notification = Notification.new(notification_params)
    @notification.save
    render :json => @notification
  end
  def update
    @notification = Notification.find(params[:id])
    @notification.update_attributes(notification_params)
    render :json => @notification
  end

  def notification_params
    params.require(:notification).permit(:is_read,:notifiable_id,:notifiable_type,:is_read,:event_id)
  end

end
