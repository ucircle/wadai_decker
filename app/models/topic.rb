class Topic < ApplicationRecord
 acts_as_taggable

 belongs_to :genre

 has_many :comments

 has_many :bookmarks

 attribute :url
 validates :title, presence: true
 def set_url(u)
   self.url = u
 end

 # def url
 #   Rails.application.routes.url_helpers.genre_topic_url(self.genre, self)
 # end
end
