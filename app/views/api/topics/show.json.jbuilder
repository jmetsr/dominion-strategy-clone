json.extract! @topic, :id, :user_id, :created_at, :updated_at, :board_id, :title, :body

json.replies @topic.replies do |reply|
  json.id reply.id
  json.user_id reply.user_id
  json.content reply.content
end
