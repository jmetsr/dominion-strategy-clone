class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :admin_in, presence: true
  belongs_to(
      :user,
      :class_name => "User",
      primary_key: :id,
      foreign_key: :admin_in
  )
  has_many(
      :subjects,
      :class_name => "Subject",
      primary_key: :id,
      foreign_key: :topic_id
  )
end