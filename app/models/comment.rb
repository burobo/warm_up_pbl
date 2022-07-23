class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :idea
  has_one :notification, dependent: :destroy
  validates :content, presence: true
end
