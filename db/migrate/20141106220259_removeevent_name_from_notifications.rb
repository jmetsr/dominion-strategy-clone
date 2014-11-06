class RemoveeventNameFromNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :event_name
  end
end
