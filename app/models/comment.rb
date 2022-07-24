class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_one :notification, dependent: :destroy
  validates :content, presence: true

  def create_comment_notification_for_originator
    return Notification.create!(
      event: Notification.events[:commented],
      comment_id: self.id,
      user_id: self.idea.user.id
    )
  end
  
  def create_comment_notifications_for_implementor
    return self.idea.favorites.select {
      |favorite| favorite.user_id != self.user.id
    }.map{
      |favorite|
        Notification.create!(
          event: Notification.events[:commented],
          comment_id: self.id,
          user_id: favorite.user_id
        )
    }
  end
end
