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
    
    notifications_for_other_users_favorite = self.idea.favorites.select {
        |favorite| favorite.user_id != self.user.id
      }.map{
        |favorite| {
          event: Notification.events[:commented],
          comment_id: self.id,
          user_id: favorite.user_id,
          created_at: Time.current,
          updated_at: Time.current
        }
      }

      unless notifications_for_other_users_favorite.blank?
        Notification.insert_all!(notifications_for_other_users_favorite)
      end
  end
end
