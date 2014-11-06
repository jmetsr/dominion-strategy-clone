class AddEventNameToNotifications < ActiveRecord::Migration
  def change
     add_column :notifications, :event_name, :string
  end
end
