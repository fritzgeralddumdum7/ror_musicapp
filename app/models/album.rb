class Album < ApplicationRecord
  validates :name, presence: true
  has_one_attached :cover_art
end
