class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_one :notification, dependent: :destroy
  validates_uniqueness_of :idea_id, scope: :user_id
end
