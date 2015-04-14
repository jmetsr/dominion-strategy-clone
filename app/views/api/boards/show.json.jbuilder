json.extract! @board, :id, :title, :created_at, :updated_at

json.topics @board.topics do |topic|
  json.id topic.id
  json.title topic.title
  json.user topic.user && topic.user.username
  json.user_id topic.user_id
  json.replies topic.replies
  if topic.replies.length > 0
  	json.last_reply_name topic.replies.sort{|x,y| y.created_at <=> x.created_at}[0].user.username
  	json.last_reply_time topic.replies.sort{|x,y| y.created_at <=> x.created_at}[0].created_at
  else
  	json.last_reply_name topic.user.username
  	json.last_reply_time topic.created_at
  end
end