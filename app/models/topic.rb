class Topic < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  include PgSearch
   multisearchable :against => [:title, :body]

  belongs_to(
      :user,
      :class_name => "User",
      primary_key: :id,
      foreign_key: :user_id
  )
  belongs_to(
      :board,
      :class_name => "Board",
      primary_key: :id,
      foreign_key: :board_id
  )
  has_many(
    :replies,
    :class_name => "Reply",
    primary_key: :id,
    foreign_key: :topic_id
    )
end
