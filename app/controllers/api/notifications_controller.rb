class Api::NotificationsController < ApplicationController
  def show
    @notification = current_user.notifications.find(params[:id])
    render :show
  end
end
