class Topic < ApplicationRecord
 acts_as_taggable
 
 belongs_to :genre
 
 has_many :comments
 

end
