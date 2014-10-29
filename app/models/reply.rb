class Reply < ActiveRecord::Base
  validates :user_id, presence: true
  validates :subject_id, presence: true
  validates :content, presence: true

  belongs_to(
      :user,
      :class_name => "User",
      primary_key: :id,
      foreign_key: :user_id
  )
  belongs_to(
      :subject,
      :class_name => "Subject",
      primary_key: :id,
      foreign_key: :subject_id
  )

end