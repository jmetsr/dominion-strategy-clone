json.array! @notifications do |notification|
  json.id notification.id
  json.user_id notification.user_id
  json.is_read notification.is_read
  json.notifiable_id notification.notifiable_id
  json.notifiable_type notification.notifiable_type
  json.created_at notification.created_at
  json.updated_at notification.updated_at
  json.event_id notification.event_id
  
  json.text notification.text
  json.url notification.url
end
