class Notification < ActiveRecord::Base
  EVENTS = {
    1 => :new_reply_to_your_topic,
    2 => :new_reply_to_topic_you_also_replied_to
  }

  EVENT_IDS = EVENTS.invert

  belongs_to :user, inverse_of: :notifications
  belongs_to :notifiable, inverse_of: :notifications, polymorphic: true
  validates :event_id, inclusion: { in: EVENTS.keys }
  validates :is_read, inclusion: { in: [true, false] }

  scope :read, -> { where(is_read: true) }
  scope :unread, -> { where(is_read: false) }
  scope :event, ->(event_name) { where(notifiable_id: EVENT_IDS[event_name]) }

  def url
    reply = self.notifiable
    return "/#/topics/" + reply.topic_id.to_s
  end

  def text
    reply = self.notifiable
    reply_user = reply.user
    topic = reply.topic
    case self.event_name
    when :new_reply_to_your_topic
      "#{reply_user.username} commented on your topic #{topic.title}"
    when :new_reply_to_topic_you_also_replied_to
      "#{reply_user.username} also commented on the topic #{topic.title}"
    end
  end

  def event_name
    EVENTS[self.event_id]
  end

  def default_url_options
    options = {}
    options[:host] = Rails.env.production? ? "https://dominion-strategy-forum-clone.herokuapp.com" : "localhost:3000"
    options
  end
end
