json.extract! @topic, :id, :user_id, :created_at, :updated_at, :board_id, :title, :body

json.board @topic.board
json.user do
  json.username @topic.user.username
end

json.replies @topic.replies do |reply|
  json.id reply.id
  json.user_id reply.user_id
  json.content reply.content
end
