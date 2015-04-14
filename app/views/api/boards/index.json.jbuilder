json.array! @boards do |board|
	json.number_of_topics board.topics.length
	json.id board.id
	json.title board.title
	json.created_at board.created_at
	json.updated_at board.updated_at

	replies = board.topics.map do |topic| # gets number of replies for total posts
		topic.replies
	end.flatten.length 

	json.number_of_posts replies + board.topics.length

end