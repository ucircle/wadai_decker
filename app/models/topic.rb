class Topic < ApplicationRecord
 acts_as_taggable

 belongs_to :genre

 has_many :comments

 has_many :bookmarks


validates :title, presence: true


end
