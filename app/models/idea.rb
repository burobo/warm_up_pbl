class Idea < ApplicationRecord
  validates :title, :outline, :detail, :user, :emoji, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :favorites
  has_many_attached :images
end
