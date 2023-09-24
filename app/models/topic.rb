class Topic < ApplicationRecord
 acts_as_taggable

 belongs_to :genre

 has_many :comments

 has_many :bookmarks


validates :title, presence: true

def url
 Rails.application.routes.url_helpers.genre_topic_url(self.genre, self)
end

end
