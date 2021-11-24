class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, :bio, presence: { 
    message: -> (object, data) do
      "#{data[:attribute]} field is required"
    end
  }
  validates :name, uniqueness: { 
    message: -> (object, data) do
      "#{data[:attribute]} has already been taken"
    end
  }

  has_one_attached :avatar
  has_one_attached :cover_art

  def to_param
    name.parameterize(preserve_case: true)
  end
end
