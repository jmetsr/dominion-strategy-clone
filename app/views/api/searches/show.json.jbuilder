@results.each do |result|
  if result.class == Reply
    json.reply do
      json.id result.id
      json.topic_id result.topic_id
      json.user_id result.user_id
      json.content result.content
      json.type "reply"
    end
  else
    json.topic do
      json.id result.id
      json.user_id result.user_id
      json.board_id result.board_id
      json.title result.title
      json.body result.body
      json.type "topic"
    end
  end
end
