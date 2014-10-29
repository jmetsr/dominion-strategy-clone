class Subject < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

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
  has_many(
    :replies,
    :class_name => "Reply",
    primary_key: :id,
    foreign_key: :subject_id
    )
end