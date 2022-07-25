class Notification < ApplicationRecord
  validates :event, presence: true
  validates :checked, inclusion: [true, false]
  enum event: { favorited: 0, commented: 1 }
  belongs_to :favorite, optional: true
  belongs_to :comment, optional: true
  belongs_to :user
end
