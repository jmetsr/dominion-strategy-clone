class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :admin_in, presence: true
  belongs_to(
      :user,
      :class_name => "User",
      primary_key: :id,
      foreign_key: :admin_in
    )
end