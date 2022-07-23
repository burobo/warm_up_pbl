class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_one :notification, dependent: :destroy
  validates :content, presence: true
  
  def create_notification_comment()
    Notification.create!(
      event: Notification.events[:commented],
      comment_id: self.id,
      user_id: self.idea.user.id
    )
  end
end
