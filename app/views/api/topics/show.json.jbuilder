json.extract! @topic, :id, :user_id, :board_id, :title, :body
json.created_at @topic.created_at.to_formatted_s(:long_ordinal)
json.updated_at @topic.updated_at.to_formatted_s(:long_ordinal)

json.board do
	json.id @topic.board.id
	json.admin_id @topic.board.admin_id
	json.title @topic.board.title
	json.created_at @topic.board.created_at.to_formatted_s(:long_ordinal)
	json.updated_at @topic.board.updated_at.to_formatted_s(:long_ordinal)
end

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
  json.created_at reply.created_at.to_formatted_s(:long_ordinal)
end
