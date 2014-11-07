json.extract! @reply, :id, :topic_id, :content, :created_at, :updated_at, :user_id
json.topic @reply.topic
json.notifications @reply.notifications
