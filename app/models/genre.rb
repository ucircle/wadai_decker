class Genre < ApplicationRecord
  has_many :topics

  validates :name, presence: true

  has_one_attached :image
end
