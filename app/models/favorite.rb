class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_one :notification, dependent: :destroy
  validates_uniqueness_of :idea_id, scope: :user_id

  def create_notification_favorite(favorite)
    Notification.create!(
      event: Notification.events[:favorited],
      favorite_id: favorite.id,
      user_id: favorite.idea.user.id
    )
  end
end
