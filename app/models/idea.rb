class Idea < ApplicationRecord
  validates :title, :outline, :detail, :user, presence: true
  belongs_to :user
end
