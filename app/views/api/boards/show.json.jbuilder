json.extract! @board, :id, :title, :created_at, :updated_at

json.topics @board.topics do |topic|
  json.id topic.id
  json.title topic.title
  json.user topic.user.username
  json.user_id topic.user_id
end
