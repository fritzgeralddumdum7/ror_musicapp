class Track < ApplicationRecord
  validates :name, :url, :credits, presence: true
end
