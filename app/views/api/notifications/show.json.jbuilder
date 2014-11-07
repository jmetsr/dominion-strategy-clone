json.extract! @notification, :id, :user_id, :is_read, :notifiable_id, :notifiable_type, :created_at, :updated_at, :event_id
json.user @notification.user
json.notifiable @notification.notifiable
