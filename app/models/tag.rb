class Tag < ApplicationRecord

  has_and_belongs_to_many :topics

  validates_uniqueness_of :name
end
