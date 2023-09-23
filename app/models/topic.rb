class Topic < ApplicationRecord
 acts_as_taggable

 belongs_to :genre

 has_many :comments

 has_many :bookmarks

 paginates_per 5

end
