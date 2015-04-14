json.extract! @topic, :id, :user_id, :created_at, :updated_at, :board_id, :title, :body

json.board @topic.board
json.user do
  json.username @topic.user.username 
  json.photo_url @topic.user.photo_url
end

json.replies @topic.replies do |reply|
  json.id reply.id
  json.user reply.user, :username, :photo_url
  json.content reply.content
  json.user_id reply.user_id
  json.notifications reply.notifications
end
