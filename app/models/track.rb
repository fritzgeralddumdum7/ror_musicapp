class Track < ApplicationRecord
  validates :name, :url, :credits, presence: { 
    message: -> (object, data) do
      "#{data[:attribute]} field is required"
    end
  }
  validates :name, length: {
    maximum: 50
  }

  has_one_attached :url
end
