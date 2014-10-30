class Board < ActiveRecord::Base
  validates :title, presence: true
  validates :admin_id, presence: true
  belongs_to(
      :user,
      :class_name => "User",
      primary_key: :id,
      foreign_key: :admin_id
  )
  has_many(
      :topics,
      :class_name => "Topic",
      primary_key: :id,
      foreign_key: :board_id,
      dependent: :destroy
  )
end