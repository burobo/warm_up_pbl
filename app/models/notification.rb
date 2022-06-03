class Notification < ApplicationRecord
  validates :event, presence: true
  validates :checked, inclusion: [true, false]
  enum event: { favorite: 0 }
  belongs_to :favorite, optional: true
  belongs_to :user
end
