class Reply < ActiveRecord::Base
  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :content, presence: true

  include PgSearch
  multisearchable :against => :content

  after_create :set_notification
  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy
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
  def set_notification
    notification = self.notifications.new
    notification.is_read = false
    notification.event_id = 1
    notification.user_id = self.topic.user.id
    notification.save!
  end

end
