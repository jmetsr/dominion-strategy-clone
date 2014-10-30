class Reply < ActiveRecord::Base
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :content, presence: true

  belongs_to(
      :user,
      :class_name => "User",
      primary_key: :id,
      foreign_key: :user_id
  )
  belongs_to(
      :topic,
      :class_name => "Topic",
      primary_key: :id,
      foreign_key: :topic_id
  )

end