class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :comments
    has_many :bookmarks

  def bookmark(topic)
    bookmarks.create(topic: topic)
  end

  def unbookmark(topic)
    bookmarks.find_by(topic: topic).destroy
  end

  def bookmarked?(topic)
    bookmarks.exists?(topic: topic)
  end
end
