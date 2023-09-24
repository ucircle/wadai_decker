class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :topic

  validates :comment, presence: true, length: { minimum: 1, maximum: 100 }
end
