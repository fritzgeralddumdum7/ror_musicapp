class Artist < ApplicationRecord
  validates :name, :bio, :permalink, presence: true

  has_one_attached :avatar
end
